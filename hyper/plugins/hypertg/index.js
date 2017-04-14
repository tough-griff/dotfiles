'use strict';

/**
 * Need to define `decorateConfig` in order for `decorateBrowserOptions` to run.
 * @param  {Object} config
 * @return {Object}
 */
exports.decorateConfig = config => {
  return config;
}

/**
 * Sets the Browser Options for Electron
 * @param  {Object} browserOptions
 * @return {Object}
 */
exports.decorateBrowserOptions = browserOptions => {
  return Object.assign({}, browserOptions, {
    titleBarStyle: 'hidden',
    frame: false
  });
}
