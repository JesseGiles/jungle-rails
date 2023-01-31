describe("User log in", () => {
  beforeEach(() => {
    // cy.exec("rails db:reset");
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

  it("Allows a user to sign up, log out and then log back in", () => {
    //signup form
    cy.get("a.nav-link").contains("Signup").click();
    cy.get('input[id="user_first_name"]').type("Frank");
    cy.get('input[id="user_last_name"]').type("Dux");
    cy.get('input[id="user_email"]').type("dux2@kumite.hk");
    cy.get('input[id="user_password"]').type("shidoshi");
    cy.get('input[id="user_password_confirmation"]').type("shidoshi");
    cy.get('input[name="commit"]').click();

    //logout and back in
    cy.get("a.nav-link").contains("Logout").click();
    cy.get('input[id="email"]').type("dux2@kumite.hk");
    cy.get('input[id="password"]').type("shidoshi");
    cy.get('input[name="commit"]').click();

    //check logged in on nav bar
    cy.get("li.nav-link").should("include.text", "Signed in as dux2@kumite.hk");
  });

  //from config/initializers/cypress_rails.rb
  it("Allows an existing user to log in", () => {
    cy.get("a.nav-link").contains("Login").click();
    cy.get('input[id="email"]').type("chongli@kumite.hk");
    cy.get('input[id="password"]').type("bricknothitback");
    cy.get('input[name="commit"]').click();

    //check logged in on nav bar
    cy.get("li.nav-link").should(
      "include.text",
      "Signed in as chongli@kumite.hk"
    );
  });
});
