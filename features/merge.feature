Feature:
  As an admin
  In order to combine two similar articles
  I want to be able to merge two articles and preserve all their text

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    Given this user exists:
      | login        | walt_whitman            |
      | password     | isingamerica            |
      | email        | transcendalist@gmail.com|
      | profile_id   | 3                       |
      | name         | Walt Whitman            |
      | state        | active                  |  
    Given this user exists:
      | login        | dr_seuss       |
      | password     | catinthehat    |
      | email        | lorax@gmail.com|
      | profile_id   | 2              |
      | name         | Dr. Seuss      |
      | state        | active         |
    Given this article exists:
      | title       | Green Eggs and Ham                       |
      | user        | dr_seuss                                 |
      | body        | Do you like green eggs and ham, sam i am |
    Given this article exists:
      | title       | Leaves of Grass                          |
      | user        | walt_whitman                             |
      | body        | resist much, obey little                 |
    Given this comment exists:
      | article     | Leaves of Grass     |
      | user        | dr_seuss            |
      | body        | bitter butter       |
    Given this comment exists:
      | article     | Green Eggs and Ham  |
      | user        | walt_whitman        |
      | body        | i sing america      |

  Scenario:
    When I go to the edit page for "Green Eggs and Ham"
    When I merge with "Leaves of Grass"
    Then I should see "Green Eggs and Ham"
    Then I should not see "Leaves of Grass"
    Then I should see "Dr. Seuss"
    Then I should not see "Walt Whitman"
    When I follow "Green Eggs and Ham"
    Then I should see "Do you like green eggs and ham, sam i am"
    Then I should see "resist much, obey little"
