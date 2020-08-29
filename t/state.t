#!/usr/bin/env node

const test = require('tape')

function state(initialState) {
  let state = initialState();
  const callbacks = {}
  let id = 0

  function transform(transformFn) {
    state = transformFn(state)

    // Call all listener callbacks when transform occurs.
    Object.keys(callbacks)
      .forEach(id => callbacks[id](state))
  }

  function addListener(callback) {
    id = id + 1
    callback(state)
    callbacks[id] = callback
    return id
  }

  function removeListener(id) {
    delete callbacks[id]
  }

  function reset() {
    transform(() => initialState())
  }

  return {
    reset,
    transform,
    addListener,
    removeListener,
  }
}


const always = v => () => v

test('Initial state stays the same after transform (reference)', t => {
  const init = {}
  const myState = state(always(init))

  myState.transform(state => {
    t.equals(state, init)
    return state
  })

  myState.transform(state => {
    t.equals(state, init)
    t.end()
  })
})

test('Event listener is called on register', t => {
  const init = {}
  const myState = state(always(init))

  myState.addListener(state => {
    t.equals(init, state)
    t.end()
  })
})

test('Event listener is called on state transform', t => {
  const init = {}
  const myState = state(always(init))

  t.plan(2)

  myState.addListener(state => {
    t.equals(state, init)
  })

  myState.transform(v => v)
  t.end()
})

test('Event listener is not called after remove', t => {
  const init = {}
  const myState = state(always(init))

  t.plan(1)

  const id = myState.addListener(state => {
    t.equals(init, state)
  })

  myState.removeListener(id)
  myState.transform(v => v)

  t.end()
})

test('Reset the state', t => {
  const initFn = always({ a: 1 })

  const myState = state(initFn)

  const changed = {a: 2}

  myState.transform(state => changed)

  myState.removeListener(
    myState.addListener(state => t.deepEquals(state, changed)))

  myState.reset()

  myState.addListener(state => t.deepEquals(state, initFn()))

  t.end()
})


