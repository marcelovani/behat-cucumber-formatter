Feature: Calculator example

  Scenario: Converting the feature
    Given I have the following feature:
      """
      Feature: Calculator

      Scenario: Adding numbers
      You can use *asciidoc markup* in _feature_ #description#.

      NOTE: This is a very important feature!

        #{IMPORTANT: Asciidoc markup inside *steps* must be surrounded by *curly brackets*.}
        Given I have numbers 1 and 2

        # {NOTE: Steps comments are placed *before* each steps so this comment is for the *WHEN* step.}

        When I sum the numbers

        # {* this is a list of itens inside a feature step}
        # {* there is no multiline comment in gherkin}
        # {** second level list item}
        Then I should have 3 as result
      """
    When I run behat with the converter
    Then the result file will be:
      """
      [
        {
          "description": "",
          "elements": [
            {
              "description": "You can use *asciidoc markup* in _feature_ #description#.\n\nNOTE: This is a very important feature!",
              "id": "calculator;adding-numbers",
              "keyword": "Scenario",
              "line": 3,
              "name": "Adding numbers",
              "steps": [
                {
                  "keyword": "Given",
                  "line": 9,
                  "match": {
                    "arguments": [
                      {
                        "val": "1"
                      },
                      {
                        "val": "2"
                      }
                    ],
                    "location": "ExampleFeatureContext::passing2()"
                  },
                  "name": "I have numbers 1 and 2",
                  "result": {
                    "duration": 12345,
                    "status": "passed"
                  },
                  "embeddings": []
                },
                {
                  "keyword": "When",
                  "line": 13,
                  "match": {
                    "location": "ExampleFeatureContext::passing0()"
                  },
                  "name": "I sum the numbers",
                  "result": {
                    "duration": 12345,
                    "status": "passed"
                  },
                  "embeddings": []
                },
                {
                  "keyword": "Then",
                  "line": 18,
                  "match": {
                    "arguments": [
                      {
                        "val": "3"
                      }
                    ],
                    "location": "ExampleFeatureContext::passing1()"
                  },
                  "name": "I should have 3 as result",
                  "result": {
                    "duration": 12345,
                    "status": "passed"
                  },
                  "embeddings": []
                }
              ],
              "type": "scenario"
            }
          ],
          "id": "calculator",
          "keyword": "Feature",
          "line": 1,
          "name": "Calculator",
          "uri": "features/feature.feature"
        }
      ]
      """