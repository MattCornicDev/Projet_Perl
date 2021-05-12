
#!/usr/bin/perl

use strict;
use warnings;
use utf8;

binmode(STDOUT,':utf8');


my %liste = ();
my $ndl=0;
my $filename = 'liste des mots trouver.txt';
open(FH, '>', $filename) or die $!;

close(FH);
open(IN,'listeChimenti.txt');
binmode(IN,":utf8");

while (my $mot =<IN>){

    chop $mot;
    $liste{$mot}=1
}
close (IN);





for (my $i=1 ; $i<=323 ; $i=$i+1)
{   

    if ($i<10) {   
    $i ="00$i";
    }
    if ($i>=10 && $i<100){
 
	$i= "0$i";

    }


open(IN,"au-coeur-du-harem/$i.txt");
binmode(IN,":utf8");


$ndl=0;  # il faut remettre le compteur à 0 à chaque fois que l on commence un nouveau fichier
while (my $ligne = <IN>) {
$ndl=$ndl+1; # ici incrémentation des numéros de fichiers
    chop $ligne;
     

     my @mots = split (/\W+/,$ligne);

     foreach my $mot (@mots) {
        
        if (exists($liste{$mot})){
             open(FH, '>>', $filename) or die $!;
                
                my $gauche = $1;
                my $cible  = $2;
                my $droite = $3;

                $gauche = substr ($gauche,-30, 30);
                $droite = substr ($droite,0, 30);

                print FH;
            
            printf ('%30s',$gauche);
            printf ('%10s',$mot);
            printf ('%-30s',$droite);


                close(FH);
       
         
        }
    

close(IN);
     }

}

