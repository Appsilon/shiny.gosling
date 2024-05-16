import { customGosling } from './customGosling';
import * as gosling from 'gosling.js';
require('higlass/dist/hglib.css');

window.jsmodule = {
  ...window.jsmodule,
  'gosling.js': {
    ...gosling,
    customGosling: customGosling
  }
};
