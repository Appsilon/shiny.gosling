import React, { useRef, useEffect } from "react";
import { GoslingComponent } from 'gosling.js';

/**
 * An extension of the GoslingComponent from gosling.js
 * @param {*} props
 * @returns
 */
export const customGosling = (props) => {
  const goslingReference = useRef(null);

  if (!!props.component_id) {
    goslingComponents.addComponent(props.component_id, goslingReference);
  };

  return(
    <div>
      <GoslingComponent ref = {goslingReference} {...props}/>
    </div>
  );
};


/**
 * A class to handle the Gosling components added via Shiny
 */
class GoslingComponents {

  constructor() {
    this.components = {};
  };

  /**
   * Adds a component to a collection of components
   * @param {String} componentId The id of the component
   * @param {String} goslingReference The reference to the customGosling
   * component
   */
  addComponent = (componentId, goslingReference) => {
    if (!this.componentIsAdded(componentId)) {
      this.components[componentId] = goslingReference;
    }
  };

  /**
   * Gets a component
   * @param {String} componentId The id of the component
   * @returns {Object} The reference to the component
   */
  getComponent = (componentId) => {
    if (this.componentIsAdded(componentId)) {
      return this.components[componentId];
    }
    console.warn(`GoslingComponents: The component ${componentId} was not added`);
  }

  /**
   * Checks if the component was already added.
   * @param {String} componentId
   * @returns Either true or false
   */
  componentIsAdded = (componentId) => {
    return componentId in this.components;
  };

  /**
   * Runs the zoomToExtent API method from gosling.js
   * See more at http://gosling-lang.org/docs/js-api#zoomtoextent)
   * @param {Object} parameters List of parameters coming from Shiny
   */
  zoomToExtent = (parameters) => {
    if (!!parameters.view_id) {
      const component = this.getComponent(parameters.component_id);
      if (!!component) {
        component.current.api.zoomToExtent(
          parameters.view_id,
          parameters.duration
        );
      }
    } else {
      warnign(`You should provide a viewId to call this method:
      See the docs at http://gosling-lang.org/docs/js-api#zoomtoextent)`);
    }
  };
  /**
   * Runs the zoomToExtent API method from gosling.js
   * See more at http://gosling-lang.org/docs/js-api#zoomto)
   * @param {Object} parameters List of parameters coming from Shiny
   */
  zoomTo = (parameters) => {
    if (!!parameters.view_id) {
      const component = this.getComponent(parameters.component_id);
      if (!!component) {
        component.current.api.zoomTo(
          parameters.view_id,
          parameters.position,
          parameters.padding,
          parameters.duration
        );
      }
    } else {
      warnign(`You should provide a viewId to call this method:
      See the docs at http://gosling-lang.org/docs/js-api#zoomto`);
    }
  };
  /**
   * Runs the zoomToGene API method from gosling.js
   * See more at http://gosling-lang.org/docs/js-api#zoomtogene)
   * @param {Object} parameters List of parameters coming from Shiny
   */
  zoomToGene = (parameters) => {
    if (!!parameters.view_id) {
      const component = this.getComponent(parameters.component_id);
      if (!!component) {
        component.current.api.zoomToGene(
          parameters.view_id,
          parameters.gene,
          parameters.padding,
          parameters.duration
        );
      }
    } else {
      warnign(`You should provide a viewId to call this method:
      See the docs at http://gosling-lang.org/docs/js-api#zoomtogene)`);
    }
  };
  /**
   * Runs the exportPng API method from gosling.js
   * See more at http://gosling-lang.org/docs/js-api#exportpng)
   * @param {Object} parameters List of parameters coming from Shiny
   */
  exportPng = (parameters) => {
    if (!!parameters.component_id) {
      const component = this.getComponent(parameters.component_id);
      if (!!component) {
        component.current.api.exportPng(parameters.transparentBackground);
      }
    } else {
      warnign(`You should provide a component_id to call this method.`);
    }
  };
  /**
   * Runs the exportPdf API method from gosling.js
   * See more at http://gosling-lang.org/docs/js-api#exportpdf)
   * @param {Object} parameters List of parameters coming from Shiny
   */
  exportPdf = (parameters) => {
    if (!!parameters.component_id) {
      const component = this.getComponent(parameters.component_id);
      if (!!component) {
        component.current.api.exportPdf(parameters.transparentBackground);
      }
    } else {
      warnign(`You should provide a component_id to call this method.`);
    }
  }
}

const goslingComponents = new GoslingComponents();

/**
 * Register the Shiny handlers
 */
const registerShinyHandlers = () => {
  Shiny.addCustomMessageHandler('zoom_to_extent', goslingComponents.zoomToExtent);
  Shiny.addCustomMessageHandler('zoom_to', goslingComponents.zoomTo);
  Shiny.addCustomMessageHandler('zoom_to_gene', goslingComponents.zoomToGene);
  Shiny.addCustomMessageHandler('export_png', goslingComponents.exportPng);
  Shiny.addCustomMessageHandler('export_pdf', goslingComponents.exportPdf);
};
registerShinyHandlers();
