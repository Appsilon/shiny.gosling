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
}

const goslingComponents = new GoslingComponents();

/**
 * Register the Shiny handlers
 */
const registerShinyHandlers = () => {
  Shiny.addCustomMessageHandler('zoom_to_extent', goslingComponents.zoomToExtent);
};
registerShinyHandlers();
