library(dplyr)
library(readr)

# sum(x)

# Reading data ####

house <- read_csv('https://jaredlander.com/data/housing.csv')
house

# Selecting Columns ####

house <- house |>
    select(
        Neighborhood, Class=Building.Classification, Units=Total.Units,
        Year=Year.Built, SqFt=Gross.SqFt,
        Income=Estimated.Gross.Income, Expense=Estimated.Expense,
        Value=Full.Market.Value, Boro
    )
house

house |>
    select(1, 3, 7)
house

house |> select(-Class)

house |>
    select(where(is.character))
house

# Slicing Rows ####

house |> slice(5, 10, 12)
house |> slice(-1)

# Filtering Rows ####

house |>
    filter(Units <= 100)

house

house |>
    filter(Units <= 100 & SqFt <= 50000)

house |>
    filter(Units > 100 | SqFt > 100000)

house |>
    filter(Boro == 'Brooklyn')

house |>
    filter(Boro == 'Brooklyn' & Units >= 100)

house |>
    filter(Boro == 'Brooklyn' | Boro == 'Queens')

house |>
    filter(Boro == 'Brooklyn' | Boro == 'Queens' | Boro == 'Manhattan')

house |>
    filter(Boro %in% c('Brooklyn', 'Queens', "Manhattan"))

house |>
    filter(Boro %in% c('Brooklyn', 'Queens') & Units <= 100)


