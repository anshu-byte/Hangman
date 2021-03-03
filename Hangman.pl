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
	print "$word\n";
	@answer=();
	for ($i=0; $i < $size; $i++) {
         $answer [$i] = '-';
    }
	while(1)
	{
		print "Here is Your Word ";
        foreach $i(@answer)
        {
            print $i;
        }
		print "\n";
		print "Make A Guess: ";
		$guessed_letter=<STDIN>;
        chomp($guessed_letter);
		$counter=0;
		$counter1=0;
		for($i=0; $i< $size;$i++)
		{
		    if($guessed_letter eq $answer[$i])
		    {
		        print "You Guessed $guessed_letter!\n";
		        print "Please Guess Different Letter\n";
				$counter1=1;
				last;
		    }
		}
		for ($i=0; $i < $size; $i++) {
		    if($guessed_letter eq $LettersArray[$i])
		    {
		        $answer[$i] = $guessed_letter;
				$counter=1;
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
			        Display();
			        print "Bad Guess - you have ";
			    	print $trials_left = $trials_left - 1;
			    	print " body parts left\n"
			    }
			    else
			    {
			        $trials_left = $trials_left - 1;
			        Display();
			    }
				
			}
		}
	}
}

sub Display() {
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
