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

$arrsize= @magical_words;
$trials_left=6;	

&main();
sub main{
	magical_word();
	$word=@magical_words[int(rand($arrsize-1)) - 1];
	print "$word\n";
	$size = length($word);
	print "$size\n";
	use Data::Dumper qw(Dumper);
	@LettersArray = split //, $word;
	while(1)
	{
		last if($trials_left eq 0);
		print "Here is Your Word\n";
		print "Guesses So Far: ";
		for ($i=0; $i < $size; $i++) {
                @guesses [$i] = '_';
        }
		print "Make A Guess: ";	
		$guessed_letter=<STDIN>;
		#condition lagana hai agar same cheez type kiya toh
		$counter=0;
		for ($i=0; $i < $size; $i++) {
			if($guessed_letter eq @LettersArray[$i])
			{
				@guesses[$i] = $guessed_letter;
				$counter=1;
			}
		}	
		if($counter eq 1)
		{
			print "Good Guess! you have ";
			print $trials_left;
			print " body parts left"	
		}
		else
		{
			print "Bad Guess - you have ";
			print $trials_left - 1;
			print " body parts left"
		}
	}
}
