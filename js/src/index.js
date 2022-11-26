import { customGosling } from './customGosling';
const gosling = require('gosling.js');
const pixi = require('pixi.js');
require('higlass/dist/hglib.css');

gosling.customGosling = customGosling;
window.jsmodule = {
  ...window.jsmodule,
  'gosling.js': gosling
};
