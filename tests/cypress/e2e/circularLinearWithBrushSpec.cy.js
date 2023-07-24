describe('circularLinearWithBrush Snapshots', () => {
  it('Screenshots are matching up', () => {
    cy.visit('http://localhost:8888')
      .then(() => {
          cy.wait(10000); // TODO (Fede Jul 24 2023) Remove explicit waits when we found an onRender/onAnimateTransform, etc.

          cy.get(".center-track")
            .should('have.length', 3)
            .each( ($element, index, $list) => {
              cy.wrap($element).should('be.visible').toMatchImageSnapshot();
            })
          
          // Interact with selectizeInput
          cy.get('.selectize-control').click();
          cy.get('div[data-value="chrX"]').click();
          cy.get('#go_to_chr').click();
          
          cy.wait(5000); // TODO (Fede Jul 24 2023) Remove explicit waits when we found an onRender/onAnimateTransform, etc.
          // event to listen to
          cy.get(".center-track")
            .should('have.length', 3)
            .each( ($element, index, $list) => {
              const snapshotName = `circular-linear-with-brush-snapshot-track-${index}`
              cy.wrap($element).should('be.visible').toMatchImageSnapshot(name = snapshotName);
            })
      });
  })
});
