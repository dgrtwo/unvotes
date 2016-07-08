.onAttach <- function(libname, pkgname) {
  packageStartupMessage("If you use data from the unvotes package, ",
                        "please cite the following:\n\n",
                        'Erik Voeten "Data and Analyses of Voting in the UN General Assembly" ',
                        "Routledge Handbook of International Organization, ",
                        "edited by Bob Reinalda (published May 27, 2013)")
}
