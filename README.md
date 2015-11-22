# OGWordlister  
This is the code for my student project for the Developing Data Products Course  in the Johns Hopkins/Coursera data science program.  

## The webpage created from this code is displayed at https://johnbarnesstudentwork.shinyapps.io/OGWordlister  

## Quick explanation of what this page is about (duplicates text on the web page):  

#Page Title Generate Wordlists For Orton-Gillingham Reading Program Level I  
  
###Quick Guide To What This Page Is and How To Use It   
  
The Orton-Gillingham system of phonics instruction is one of the most effective methods of teaching reading. The system is 
built around teaching students precise rules for decoding and pronouncing various kinds of English words, and then reinforcing the rules with practice. To practice successfully, students need lists of words which follow the rules they already know, plus
the rules they are just learning.  
  
Orton-Gillingham Level I is reading words in which a single vowel between two consonants, or an initial single vowel preceding
a consonant, is given its short pronunciation. Ten rules (the check boxes at the right) govern such words. A regular feature 
of Orton-Gillingham practice is the use of nonsense words which clearly have only one correct English pronunciation;a student 
who can pronounce them has demonstrated mastery of the phonics principle involved, since the student cannot have just 
memorized the pronunciation for a nonsense word.  
  
This web page would be used by a teacher or reading specialist. A normal first-grader or an older child or adult with reading 
difficulty would usually work with a list of 25-60 words, of which 10%-25% might be nonsense words.  
  
All the words must fit the rules the student has learned or is learning, and students will have a wide mixture of mastery of 
rules. Thus each word list must be tailored to an individual student, and the process of finding/devising nonduplicative word 
lists, sometimes multiple ones, for 5-30 students per day, is laborious and time consuming. This page provides a near-instant 
solution, with word lists that can be quickly cut and pasted.  
  
Information at the upper right is supplied for teachers who need to maintain an administrative record with student name, date,
and what the word list is to be used for. The teacher then sets the overall length of the word list to any length from 1 to 
100 (25-50 is typical) and uses the slider to select what proportion of the words will be nonsense words. The generated word 
list, both real and nonsense words, will all be interpretable by the rules which have been selected; they also have been 
vetted as inoffensive and not exceptions. No word occurs in the same list twice. The serial number box is actually a seed 
setter so that a teacher could regenerate exactly the same list, or keep a list the same while lengthening or shortening it.  
  
If a teacher selects too few rules or a mixture of them which does not allow generation of a word list of the required length,
the page displays warnings and suggestions for corrections.  
 
  
## Also in this repository:  
Besides the ui.R and server.R files for the web page, I've included two supporting documents: the dictionary of possibly 
generated words which classifies them as Real, Nonsense, and Banned, and an explanation of the 8 different reasons why any 
given word might be banned. If you're really curious about how the page does what it does and what decisions went into it, 
that may be of interest.
