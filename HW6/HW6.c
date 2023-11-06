// NAME : Brian Bradley and Karyn Remsing
// CS 4350 - 251 - Unix Systems Programming
// Assignment Number: 6
// Due Date: 11 / 6 / 2023

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/utsname.h>
#include <unistd.h>

int main()
{
	printf("\n\nSystem/File Manipulation Program\n\n\n");

	// 1) create file
	char command[50];
	strcpy(command, "touch p6in-1.txt");
	system(command);
	printf("1. p6in-1.txt File is created.");
	
	// 2) show file permissions
	strcpy(command, "ls -l p6in-1.txt");
	printf("\n\n2. File Permission status is :\n");
	system(command);

	// 3) change file permissions
	strcpy(command, "chmod 700 p6in-1.txt");
	system(command);
	printf("\n\n3. File mode is changed.");

	// 4) show file permissions again
	//  **** ISSUE **** 
	//  for some reason the printf doesn't print before the ls command prints
	//  can't figure out why
	printf("\n\n4. File permissions status is.");
	strcpy(command, "ls -l p6in-1.txt");
	system(command);

	// 5) append file
	printf("\n\n5. Text is appended to the file.");
	FILE *file;
	file = fopen("p6in-1.txt", "a");
	char append[1024];
	strcpy(append, "Texas State University , Fall 2023 , Unix Programming");
	fputs(append, file);
	
	// 6) close file
	fclose(file);
	printf("\n\n6. File is closed.");

	// 7) Size of file1
	struct stat file_stats;
	if(stat("p6in-1.txt", &file_stats) != -1)
		printf("\n\n7. Size of the create file : %ld", file_stats.st_size);
	else
		printf("\n\nError - Could not get file size");

	// 8) Display content w/ system command
	printf("\n\n8. Content of the input file : \n");
	strcpy(command, "cat p6in-1.txt");
	system(command);

	// 9) Current date and time
	printf("\n\n9. Current date and time is : ");
	strcpy(command, "date");
	system(command);

	// 10) time of last file access
	printf("\n\n10.Time of last file access : %ld : %s", file_stats.st_atime,
			ctime(&file_stats.st_ctime));

	// 11) System name
	int uname(struct utsname *name);

	struct utsname uts;
	uname(&uts);
	printf("\n\n11.System name: %s", uts.sysname);

	// 12) local host name
	// *** ISSUE ***
	// i cant find anything on local host, only host

	// 13) local host name
	char hostbuffer[256];
	int hostint;
	hostint = gethostname(hostbuffer, sizeof(hostbuffer));
	printf("\n\n13.Host name : %s", hostbuffer);

	// 14) Process id
	printf("\n\n14.The process id : %d", getpid());

	// 15) Parent process id
	printf("\n\n15.Parent process id : %d", getppid());

	// this is here for testing purposes
	// since we are appending the file, keeps getting piled on
	// just delete file and it will be remade each time program is run
	strcpy(command, "rm p6in-1.txt");
	system(command);
	
	printf("\n\n\n\nBrian Bradley and Karyn Remsing");
	printf("\n\nNovember - 2023\n");


	return 0;
}
