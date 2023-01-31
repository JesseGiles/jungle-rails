describe("User log in", () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit("http://localhost:3000/");
  });

  it("visits the home page", () => {
    // We use the `cy.get()` command to get all elements that match the selector.
    // Then, we use `should` to assert that the text in the index header should be present
    cy.get(".hero").should(
      "have.text",
      "\n  \n    Welcome to\n    The Jungle\n    Where you can find any plants!\n  \n"
    );
  });

  it("Allows a user to sign up and then log in", () => {
    cy.get("a.nav-link").contains("Signup").click();
  });
});
