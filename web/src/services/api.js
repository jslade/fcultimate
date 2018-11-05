import queryString from 'query-string'

export default class API {
  GET ({ path, query }) {
    return this.request(
      { method: 'GET', path, query }
    )
  }

  POST ({ path, body }) {
    return this.request(
      { method: 'POST', path, body }
    )
  }

  PUT ({ path, body }) {
    return this.request(
      { method: 'PUT', path, body }
    )
  }

  DELETE ({ path, query }) {
    return this.request(
      { method: 'DELETE', path, query }
    )
  }

  request ({ method, path, body, query }) {
    const request = new window.Request(
      this.path(path, query), this.options({ method, body})
    )

    return window.fetch(request)
      .then(this.checkStatus(request))
      .then(this.parseJSON)
      .catch(error => this.onError(error, request))
  }

  path (path, query) {
    if (!path) {
      throw new Error('Unsuccessful API service request: missing path')
    }

    const base = '/api'
    const sub = path.charAt(0) === '/' ? path : '/' + path
    const qstr = query ? this.queryString(query) : ''

    return `${base}${sub}${qstr}`
  }

  queryString (query) {
    return '?' + queryString.stringify(query, {arrayFormat: 'bracket'})
  }

  options ({ method, body }) {
    const options = { method, headers: {} }

    if (body) {
      if (body instanceof window.FormData) {
        Object.assign(options, { body })
      } else {
        Object.assign(options.headers, { 'Content-Type': 'application/json' })
        Object.assign(options, { body: JSON.stringify(body)})
      }
    }

    // At least for now, force no-cache
    Object.assign(options.headers, { 'Cache-Control': 'no-cache' })

    return options
  }

  checkStatus (request) {
    return (response) => {
      if (response.ok) return response
      const error = new Error(`Unsuccessful API service request: ${response.statusText}`)
      error.request = request
      error.response = response
      throw error
    }
  }

  parseJSON (response) {
    if (response.status === 204) { // No Content
      return {}
    } else {
      return response.json()
    }
  }

  onError (error, request) {
    console.log(error)
  }
}
