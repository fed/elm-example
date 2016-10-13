import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Html.App as App

pluralise : String -> String -> Int -> String
pluralise singular plural quantity =
    if quantity == 1 then
        singular
    else
        plural

type alias Model =
    { shelves : Int
    , username : String
    }

type alias Action =
    { actionType : String
    , data : Int
    }

-- represents the current application state
model : Model
model =
    { shelves = 0
    , username = "fknussel"
    }

-- transitions between app states based on user actions
update : Action -> Model -> Model
update action model =
    if action.actionType == "increment" then
        -- we are not mutating the model, rather returning a new one
        { model | shelves = model.shelves + action.data }
    else if action.actionType == "decrement" then
        { model | shelves = model.shelves - action.data }
    else
        model

view model =
    let
        isDisabled =
            model.shelves <= 0

        caption =
            (toString model.shelves)
            ++ " "
            ++ (pluralise "shelf" "shelves" model.shelves)
    in
        div
            [ class "content", id "main-body" ]
            [
                h1 [] [ text "Pluraliser" ],
                button [ onClick { actionType = "increment", data = 1 } ] [ text "Add a shelf" ],
                button [ onClick { actionType = "decrement", data = 1 }, disabled isDisabled ] [ text "Explode a shelf" ],
                text (caption)
            ]

app =
    App.beginnerProgram
        { model = model
        , view = view
        , update = update
        }

main = app
