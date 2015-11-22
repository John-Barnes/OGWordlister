library(shiny)

# Define UI for Orton-Gillingham Level I Wordlist Generation
shinyUI(fluidPage(

      # Application title
      titlePanel("Generate Wordlists For Orton-Gillingham Reading Program Level I"),

      sidebarLayout(

            # Enter data required to generate the wordlist
            sidebarPanel(h2("Enter information"),
                  h3("Student, appointment, and purpose"),
                  textInput("Student",
                            "Student Name",
                            value = "",
                            width = 400),
                  dateInput("Date", "Date to be used"),
                  checkboxGroupInput("Use",
                                     label= "Main use of this list:",
                                     choices=c("Assessment"="assessment",
                                               "In-session practice"="practice",
                                               "Home practice"="homework",
                                               "Reserve resource"="resource",
                                               "Example"="example",
                                               "Other"="other")
                                     ),
                  h3("About the word list"),
                  numericInput("NumberOfWords",
                               "Number of Words Needed in List",
                               value= 40,
                               min = 1,
                               max = 100,
                               step = 1,
                               width = NULL),
                  sliderInput("FractionOfNonsense",
                              "What fraction of word list should be nonsense words?",
                              min = 0,
                              max = 1,
                              value = .1,
                              step=.05,
                              ticks=TRUE),
                  checkboxGroupInput("RulesToApply",
                                     label = "Phonics rules to be practiced or tested in this list:",
                                     choices=c("Rule 1: Initial blank/f/l/m/n/r/s,
                                               middle a/i/o,
                                               final d/g/p/t"="Rule01",
                                               "Rule 2: Initial b/sh/h/j,
                                               middle u,
                                               final b/sh"="Rule02",
                                               "Rule 3: Final ck"="Rule03",
                                               "Rule 4: Middle short e"="Rule04",
                                               "Rule 5: Initial and final
                                               th/ch/tch"="Rule05",
                                               "Rule 6: Initial qu/wh"="Rule06",
                                               "Rule 7: Words ending in -all"="Rule07",
                                               "Rule 8: FLOSS-Z spelling rule"="Rule08",
                                               "Rule 9: Plurals & 3rd person singular
                                               with suffix s"="Rule09",
                                               "Rule 10: Final ng/nk"="Rule10"),
                                     selected = "Rule01",
                                     inline = FALSE,
                                     width = 600),
                  numericInput("Seed",
                               "Serial Number: enter any number from 1 to 99999,
                               change for new wordlist,
                               use old serial number to re-create exact wordlist",
                               value= NA,
                               min = 1,
                               max = 99999,
                               step = 1,
                               width = NULL),
                  actionButton("RunButton",
                               label = "Request word list",
                               icon = NULL,
                               width = NULL)

            ),

            # Display identifying information for the wordlists, the wordlists, or
            # if necessary the error messages if user requested a list that can't be
            # generated
            mainPanel(h1(textOutput("MainWordListHeader")),
                      h2(textOutput("RealWordHeading")),
                      h4(textOutput("RealWordsList")),
                      h2(textOutput("NonsenseWordHeading")),
                      h4(textOutput("NonsenseWordsList")),
                      h2(textOutput("ImpossibleMessage0")),
                      h3(textOutput("ImpossibleMessage1")),
                      h3(textOutput("ImpossibleMessage2")),
                      h3(textOutput("ImpossibleMessage3")),
                      h3(textOutput("ImpossibleMessage4")),
                      h2(textOutput("MainWordListFooter")),
                      h3("Quick Guide To What This Page Is and How To Use It"),
                      p("The Orton-Gillingham system of phonics instruction is one of the most effective methods of teaching reading. The system is built around teaching students precise rules for decoding and pronouncing various kinds of English words, and then reinforcing the rules with practice. To practice successfully, students need lists of words which follow the rules they already know, plus the rules they are just learning."),
                        p("Orton-Gillingham Level I is reading words in which a single vowel between two consonants, or an initial single vowel preceding a consonant, is given its short pronunciation. Ten rules (the check boxes at the right) govern such words. A regular feature of Orton-Gillingham practice is the use of nonsense words which clearly have only one correct English pronunciation;a student who can pronounce them has demonstrated mastery of the phonics principle involved, since the student cannot have just memorized the pronunciation for a nonsense word."),
                      p("This web page would be used by a teacher or reading specialist. A normal first-grader or an older child or adult with reading difficulty would usually work with a list of 25-60 words, of which 10%-25% might be nonsense words."),
                      p("All the words must fit the rules the student has learned or is learning, and students will have a wide mixture of mastery of rules. Thus each word list must be tailored to an individual student, and the process of finding/devising nonduplicative word lists, sometimes multiple ones, for 5-30 students per day, is laborious and time consuming. This page provides a near-instant solution, with word lists that can be quickly cut and pasted."),
                      p("Information at the upper right is supplied for teachers who need to maintain an administrative record with student name, date, and what the word list is to be used for. The teacher then sets the overall length of the word list to any length from 1 to 100 (25-50 is typical) and uses the slider to select what proportion of the words will be nonsense words. The generated word list, both real and nonsense words, will all be interpretable by the rules which have been selected; they also have been vetted as inoffensive and not exceptions. No word occurs in the same list twice. The serial number box is actually a seed setter so that a teacher could regenerate exactly the same list, or keep a list the same while lengthening or shortening it."),
                      p("If a teacher selects too few rules or a mixture of them which does not allow generation of a word list of the required length, the page displays warnings and suggestions for corrections.")
                  ),
            position = c("right")
            )
      )
)
