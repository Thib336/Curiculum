# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.
options(encoding = 'UTF-8')



# Knit the HTML version
rmarkdown::render("C:/Users/DELL/Dropbox/Curiculum/con R/cv_0109.Rmd", encoding="UTF-8",  
                  params = list(pdf_mode = FALSE),
                  output_file = "cv_render.html" )



# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("C:/Users/DELL/Dropbox/Curiculum/con R/cv_0109.rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = "C:/Users/DELL/Dropbox/Curiculum/con R/cv_render15.pdf")


# Convert to PDF using Pagedown
pagedown::chrome_print(input = "C:/Users/DELL/Dropbox/Curiculum/con R/cv_2109.html",
                       output = "C:/Users/DELL/Dropbox/Curiculum/con R/cv_render2109.pdf")
