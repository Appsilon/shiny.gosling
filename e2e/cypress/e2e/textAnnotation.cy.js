describe('textAnnotation Snapshots', () => {
    it('Screenshots are matching up', () => {
      cy.visit('http://127.0.0.1:8888')
        .then(() => {
            cy.wait(10000); // TODO (Fede Jul 24 2023) Remove explicit waits when we found an onRender/onAnimateTransform, etc.
  
            cy.get(".center-track")
              .should('have.length', 1)
              .each( ($element, index, $list) => {
                cy.wrap($element).should('be.visible').toMatchImageSnapshot();
              })
        });
    })
  });
  