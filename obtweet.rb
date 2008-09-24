#!/opt/local/bin/ruby

require 'base64'
require 'net/http'
require "rubygems"

a = ["Change instrument roles", "Lowest common denominator", "Consider different fading systems", "Bridges -build -burn", "Distorting time",
     "Is the information correct?", "Decorate, decorate", "Mute and continue", "Accretion", "Make a blank valuable by putting it in an exquisite frame",
      "Overtly resist change", "Remove specifics and convert to ambiguities", "Always give yourself credit for having more than personality",
      "Be extravagant", "Disconnect from desire", "Balance the consistency principle with the inconsistency principle", "Question the heroic approach",
      "Don't be frightened of cliches", "You don't have to be ashamed of using your own ideas", "Feed the recording back out of the medium",
      "Emphasize repetitions", "Get your neck massaged", "It is quite possible (after all)", "What is the reality of the situation?", "Tidy up",
      "Convert a melodic element into a rhythmic element", "Accept advice", "Faced with a choice, do both (given by Dieter Rot)",
      "Listen to the quiet voice", "What are you really thinking about just now?", "Are there sections? Consider transitions",
      "Do the words need changing?", "The most important thing is the thing most easily forgotten", "Twist the spine", "Children -speaking -singing",
      "Do the washing up", "Don't stress on thing more than another [sic]", "Work at a different speed", "Turn it upside down", "Ask your body",
      "Lost in useless territory", "Is it finished?", "State the problem in words as clearly as possible",
      "Look closely at the most embarrassing details & amplify them", "Think of the radio", "Tape your mouth", "Ghost echoes",
      "A very small object Its center", "Put in earplugs", "Assemble some of the elements in a group and treat the group",
      "Mechanicalize something idiosyncratic", "Allow an easement (an easement is the abandonment of a stricture)", "Water",
      "You can only make one dot at a time", "Dont be afraid of things because they're easy to do", "Reevaluation (a warm feeling)",
      "You are an engineer", "Emphasize the flaws", "Simple subtraction", "Simply a matter of work", "Just carry on",
      "Dont be frightened to display your talents", "Give the name away", "Remove ambiguities and convert to specifics",
      "Remember those quiet evenings", "Make a sudden, destructive unpredictable action; incorporate", "(Organic) machinery",
      "Be dirty", "Intentions -nobility of -humility of -credibility of", "Look at the order in which you do things", "Breathe more deeply",
      "Take a break", "The inconsistency principle", "Go slowly all the way round the outside", "Consult other sources -promising -unpromising",
      "Go outside. Shut the door.", "Honor thy error as a hidden intention", "Abandon normal instruments",
      "Short circuit (example: a man eating peas with the idea that they will improve his virility shovels them straight into his lap)",
      "A line has two sides", "Use an unacceptable color", "Don't break the silence", "What are the sections sections of? Imagine a caterpillar moving",
      "Use fewer notes", "Disciplined self-indulgence", "Left channel, right channel, center channel",
      "Make an exhaustive list of everything you might do & do the last thing on the list", "Humanize something free of error", "Idiot glee (?)",
      "Only one element of each kind", "Repetition is a form of change", "Do we need holes?", "Use an old idea", "Into the impossible", "Use filters",
      "Discover the recipes you are using and abandon them", "Is there something missing", "Give way to your worst impulse", "Cluster analysis",
      "Destroy -nothing -the most important thing", "Towards the insignificant", "Fill every beat with something", "Cascades", "Use 'unqualified' people",
      "Reverse", "Always first steps", "Change nothing and continue with immaculate consistency", "Ask people to work against their better judgement",
      "Discard an axiom", "Courage!", "How would you have done it?", "Trust in the you of now", "Cut a vital connection", "The tape is now the music",
      "Take away the elements in order of apparent non-importance", "Not building a wall but making a brick", "Spectrum analysis", "Emphasize differences",
      "Imagine the piece as a set of disconnected events", "Do something boring", "Infinitesimal gradations", "What wouldn't you do?",
      "What mistakes did you make last time?", "Do nothing for as long as possible", "What would your closest friend do?",
      "Define an area as 'safe' and use it as an anchor"]

status = a[(rand * a.length).to_i]

email = 'email@domain.com'
pass = 'MY_EXTREMELY_SECRET_PASSWORD'
auth = Base64.encode64(email + ':' + pass)

h = Net::HTTP.new('twitter.com', 80)

resp, data = h.post('/statuses/update.json',
                    "status=" + status,
                    { 'Authorization' => 'Basic ' + auth })
