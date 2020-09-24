describe('User accounts', () => {
  it('allows a user to sign in', () => {
    cy.visit('/');

    cy.contains('Sign in').click();

    cy.contains('label', 'Email')
      .click()
      .type('user@example.com');
    cy.contains('label', 'Password')
      .click()
      .type('password');

    cy.contains('input', 'Sign in').click();

    cy.location().should((location) => {
      expect(location.pathname).to.eq('/dashboard');
    });
    cy.contains('Signed in as: user@example.com');
  });
});
