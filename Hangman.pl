#!/usr/local/bin/perl

#magical words
sub magical_word(){
	open ( $fh, "<", "data.txt" );
	$number_of_line =0;
	$magical_sentence="";
	while ( $line = <$fh> ) {
		$magical_sentence.=$line;
	}
	close($fh);
	@magical_words = split(", ",$magical_sentence); 
}

$trials_left=6;

&main();
sub main{
	magical_word();
	$word=@magical_words[int(rand(100))];
	$size = length($word);
	use Data::Dumper qw(Dumper);
	@LettersArray = split //, $word;
	@answer=();
	for ($i=0; $i < $size; $i++) {
         $answer [$i] = '-';
    }
    $guessed_variables='';
    $global_counter=0;
	while(1)
	{
		print "Here is Your Word ";
		
        foreach $i(@answer)
        {
            print $i;
        }
		print "\n";
		if($trials_left<6)
		{
		    print "Wrong Guesses so far:- $guessed_variables\n";
		}
		print "Make A Guess: ";
		$guessed_letter=<STDIN>;
        chomp($guessed_letter);
        if(length($guessed_letter)==1)
        {
    		$counter=0;
    		$counter1=0;
    		for($i=0; $i< $size;$i++)
    		{
    		    if($guessed_letter eq $answer[$i])
    		    {
    		        print "You Arleady Guessed $guessed_letter!\n";
    		        print "Please Guess Different Letter\n";
    				$counter1=1;
    				last;
    		    }
    		}
 
    		if($counter1==0)
    		{
    		    for ($i=0; $i < $size; $i++) {
        		    if($guessed_letter eq $LettersArray[$i])
        		    {
        		        $answer[$i] = $guessed_letter;
        				$counter=1;
        		    }
    	    	}
    		    
    		}
    		
    		if($counter==1)
    		{
    		    if(check_win())
    	        {
    	            print "Word:-$word";
                    print "\nYou Won!";
                    exit 0;
    	        }
				
				Display();
			
    			print "Good Guess! you have ";
    			print $trials_left;
    			print " body parts left\n"
    		}
    		else
    		{
    			if($counter1==0)
    			{
    			    if($trials_left!=1)
    			    {
						
    			        $trials_left = $trials_left - 1;
						Display();
    			        print "Bad Guess - you have ";
    			    	print $trials_left;  
    			    	print " body parts left\n";
    			    	if($trials_left<6)
            	    	{
                		    if($global_counter==0)
                		    {
                		        $guessed_variables=$guessed_letter;
                		        $global_counter=$global_counter+1;
                		    }
                		    else
                		    {
                		        $counter2=0;
                		        use Data::Dumper qw(Dumper);
                		        @wrong_guesses_array = split //, $guessed_variables;
                            	$arrSize = @wrong_guesses_array;
                            	for ($i=0; $i < $arrSize; $i++) {
                            	    if($guessed_letter eq $wrong_guesses_array[$i])
                            	    {
                            	        print "You Arleady Guessed $guessed_letter!\n";
                            	        print "And It was Wrong\n";
                    		            print "Please Guess Different Letter\n";
                    		            $counter2=1;
                    		            last;
                            	    }
                            	}
                            	if($counter2==0)
                            	{
                            	    $guessed_variables.=$guessed_letter;
                            	}
                		    }
                		}
    			    }
    			    else
    			    {
    			        $trials_left = $trials_left - 1;
    			        Display();
    			    }
    			}
    		}
        }
        else
        {
            print "You either didn't typed any letter Or\n";
            print "You typed more than one letter\n";
        }
	}
}


sub Display(){
    if($trials_left==6)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($trials_left==5)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($trials_left==4)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($trials_left==3)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($trials_left==2)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($trials_left==1)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |     /\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    else
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     x\n";
        print "  |    \\|/\n";
        print "  |     /\\\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
        print "You lost!\n";
        exit 0;
    }
}

sub check_win() {
	$alpha_numeric;
	for($i=0; $i<$size;$i++)
	{
        if ($LettersArray[$i] ne $answer [$i]) {
            return 0;
        }
	}
	return 1;
}