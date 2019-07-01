const os = require('os');
const path = require('path');
const repl = require('repl');

const prompt = `${process.version} ❯ `;
const replServer = repl.start({ prompt });

replServer.setupHistory(
  path.join(os.homedir(), '.node_repl_history'),
  (err, repl) => {
    if (err) throw err;
  }
);

try {
  const lodash = require('lodash');

  function initializeContext(ctx) {
    Object.defineProperty(ctx, '_', {
      value: lodash.runInContext(ctx)
    });
  }

  initializeContext(replServer.context);
  replServer.on('reset', initializeContext);

  Object.defineProperty(Array, 'toy', {
    /**
     * Generates an array of length `n` with values generated by the callback.
     * @param {number} n
     * @param {(num: number) => any} iteratee
     */
    value: function toy(n = 10, iteratee = i => i + 1) {
      return _.times(n, iteratee);
    }
  });

  Object.defineProperty(Object, 'toy', {
    /**
     * Generates an object of length `n` key value pairs. Each key and value is
     * can be generated by a callback.
     * @param {number} n
     * @param {(num: number) => string} keyIteratee
     * @param {(num: number) => any} valIteratee
     * @returns {{string: any}}
     */
    value: function toy(
      n = 10,
      keyIteratee = c => String.fromCharCode(96 + (c + 1)),
      valIteratee = i => i + 1
    ) {
      const array = Array.toy(n, keyIteratee);
      return _.zipObject(array, Array.toy(n, valIteratee));
    }
  });
} catch (err) {
  if (err.code === 'MODULE_NOT_FOUND') {
    console.log(err);
    console.log('Missing dependencies, installing in a separate process');
    console.log('Restart this interpreter later for improved functionality!');
    const { exec } = require('child_process');
    exec('npm install lodash');

    replServer.displayPrompt();
  }
}
