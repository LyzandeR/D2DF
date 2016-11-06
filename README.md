## D2DF

An R package with a set of independent functions (day to day functions) which I have found myself using more regularly.

There is no obvious connection between the functions.

The package won't be released on CRAN as these are personal functions which won't be of great interest to the community.

The package can still be installed through `devtools::install_github('Lyzander/D2DF')`.

## Funtions

The function included so far are:

* distance - Calculates the distance between two vectors. Supported methods include euclidean, manhattan, canberra and minkowski.

* feature_scale -  Scales an atomic vector between 0 and 1.

* na2value - Uses `data.table::set` to convert NAs in selected columns to a value.

* remove_cor - A function which identifies correlated variables. Solves multicollinearity problem.

* safe_ifelse - Like regular `ifelse` with the difference that this maintains the class (e.g. can be used with dates).

* switchv - A vectorised version of `switch` using `vapply`.