Feature:
  As a person who is not an admin
  In order to avoid unathorized merges
  I want to be unable to merge two articles

  Background:
    Given the blog is set up
  	Given this user exists:
  	  | login        | publisher                 |
      | password     | isingamerica              |
      | email        | transcendalist@gmail.com  |
      | profile_id   | 3                         |
      | name         | publisher                 |
      | state        | active                    |  
  	Given this article exists:
      | title       | Leaves of Grass                 |
      | user        | publisher                       |
      | body        | resist much, obey little merge  |

  Scenario:
    Given I am logged in as "publisher"
    Given I am on the edit page for "Leaves of Grass"
    Then I should not see "merge"