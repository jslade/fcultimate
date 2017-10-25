// https://github.com/facebookincubator/create-react-app/issues/3199
// This is a tmp workaround for a warning message that occurs running
// yarn test with React 16

const raf = global.requestAnimationFrame = (cb) => {
  setTimeout(cb, 0)
}

export default raf

// Since it's in the __tests__ folder, it will be treated as
// a test suite --> need at least one test
it('', function() {})
