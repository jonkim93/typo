Feature:
  As a person who is not an admin
  In order to avoid unathorized merges
  I want to be unable to merge two articles

  Scenario:
    Given the blog is set up with a non-admin
    Given I am on the edit page
    Then I should not see the merge form

  Scenario:
    Given the blog is set up 
    Given I am on the edit page
    Then I should see the merge form