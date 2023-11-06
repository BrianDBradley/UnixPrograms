// NAME : Brian Bradley and Karyn Remsing
// CS 4350 - 251 - Unix Systems Programming
// Assignment Number: 6
// Due Date: 11 / 6 / 2023
//
// 1. The programs must be syntactically and logically correct. The program
// will be tested using Zeus Server at the university using the simple gcc
// command followed by the filename.c such as gcc xxxx.c
// 2. Look at the sample run and follow the format.
// 3. You must upload your solution using Canvas - Make sure you include the
// above as comments in your program.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/utsname.h>
#include <unistd.h>
#include <sys/resource.h>

int main()
{
	printf("\n\nSystem / File Manipulation Program\n\n\n");

	// 1) create file
	char command[50];   // Array to hold command input
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
	printf("\n3. File mode is changed .");

	// 4) show file permissions again
	printf("\n\n4. File permissions status is .\n");
	fflush(stdout);    // flush the output buffer for proper order of display
	strcpy(command, "ls -l p6in-1.txt");
	system(command);

	// 5) append file
	printf("\n5. Text is appended to the file.");
	FILE *file;		// file to append to
	file = fopen("p6in-1.txt", "a");
	char append[1024];     //array for appended text
	strcpy(append, "Texas State University , Fall 2023 , Unix Programming");
	fputs(append, file);
	
	// 6) close file
	fclose(file);
	printf("\n\n6. File is closed.");

	// 7) Size of file1
	struct stat file_stats;		// stucture to hold details for the file
	if(stat("p6in-1.txt", &file_stats) != -1)
		printf("\n\n7. Size of the created file : %lld", file_stats.st_size);
	else
		printf("\n\nError - Could not get file size");

	// 8) Display content w/ system command
	printf("\n\n8. Content of the input file : \n");
	strcpy(command, "cat p6in-1.txt");
	system(command);

	// 9) Current date and time
	printf("\n\n9. Current date and time is : ");
	fflush(stdout); // fflush the output buffer for proper order of display
	strcpy(command, "date");
	system(command);

	// 10) time of last file access
	printf("\n10.Time of last file access : %ld : %s", file_stats.st_atime,
			ctime(&file_stats.st_ctime));

	// 11) System name
	int uname(struct utsname *name);

	struct utsname uts;		// structure to hold the system name
	uname(&uts);
	printf("\n11.System name : %s", uts.sysname);

	// 12) local host name
	char localhostbuffer[256];		// holds the local host name
	int localhostint;		// integer to hold local host size
	localhostint = gethostname(localhostbuffer, sizeof(localhostbuffer));
	printf("\n\n12.Local host name : %s", localhostbuffer);       

	// 13) host name
	char hostbuffer[256];	// holds host name
	int hostint;	// integer to hold the host name size
	hostint = gethostname(hostbuffer, sizeof(hostbuffer));
	printf("\n\n13.Host name : %s", hostbuffer);

	// 14) Process id
	printf("\n\n14.The process id : %d", getpid());

	// 15) Parent process id
	printf("\n\n15.Parent process id : %d", getppid());

	//  16. Display The priority level of the process :
	int which = PRIO_PROCESS;	//the process that is priority
	id_t pid;	// real user procsess id				
	int ret;	// return value for level of priority
	pid = getpid();	
	ret = getpriority(which, pid);
	printf("\n\n16.Priority level of the process : %d", ret);

	// 17. Display The file Name :
	// 18. Display The device :
	// 19. Display The inode :
	// 20. Display Number of hard link :
	// 21. Display Owner’s user ID :
	// 22. Display Owner’s group ID :
	// 23. Display Owner’s effective user ID :
	char filename[] = "p6in-1.txt";		// holds the first file name
	uid_t euid;		// user identification number for effective uid		
	euid = geteuid();

	if (stat(filename, &file_stats) == 0) {
		printf("\n\n17.The file Name is : %s", filename);
		printf("\n\n18.The device is : %d\n", file_stats.st_dev);
		printf("\n19.The inode is : %llu\n", file_stats.st_ino);
		printf("\n20.Number of hard links : %hu\n", file_stats.st_nlink);
        printf("\n21.Owner's user ID: %d\n", file_stats.st_uid);
        printf("\n22.Owner's group ID: %d\n", file_stats.st_gid);
        printf("\n23.Owner's effective user ID: %d\n", (int)geteuid());

    } else {
        perror("stat");
        return 1;
    }	

	// 24. Append The following line to the text file :
	//     Last Step.
	printf("\n24.New Text is appended to p6in-1.txt file");
	file = fopen(filename, "a");
	if (file == NULL) {
        perror("fopen");
        return 1;
    }
	char append2[] = "\nLast Step.";	// Text to be appended to file
	fputs(append2, file);
	fclose(file);

	// 25. Using a System Command , redisplay the content of text file :
	printf("\n\n25.Redisplaying the content of p6in-1.txt file. \n");
	strcpy(command, "cat p6in-1.txt");
	system(command);

	// 26. Redisplay the Size of created text file :
	if(stat("p6in-1.txt", &file_stats) != -1)
		printf("\n\n26.Redisplaying the size of created text  file %lld", file_stats.st_size);
	else
		printf("\n\nError - Could not get file size");

	// 27. Rename The file to be textfilename-2.txt ( p6in-2.txt ) :
	char newname[] = "p6in-2.txt";
	ret = rename(filename, newname);
	if (ret == 0) {
		printf("27.\n\n27.Renamed the file to be %s\n", newname);
	} else {
		printf("Error: unable to rename the file");
	}

	// 28. Using a System Command , display the content of the new text file :
	printf("\n28.The content of the new p6in-2.txt file \n");
	strcpy(command, "cat p6in-2.txt");
	system(command);

	// 29. Remove the new text files from your current Directory.
	int status;
	status = remove(newname);
	if (status == 0)
		printf("\n\n29.Removed p6in-2.txt files from current Directory.");
	else {
		printf("Unable to delete the file\n");
		perror("Error");
	} 

	// 30. Using System Command , display the content of deleted text file.
	printf("\n\n30.Displaying the content of p6in-2.txt file. \n");
	strcpy(command, "cat p6in-2.txt");
	system(command);

	
	printf("\n\n\nBrian Bradley and Karyn Remsing");
	printf("\n\nNovember - 2023\n");


	return 0;
}
