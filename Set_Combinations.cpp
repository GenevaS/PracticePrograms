// G.Smith
// Set_Combinations.cpp : Defines the entry point for the console application.
// A simple program implementing the recursive combination of elements to create all
// subsets of a vector<string> input.

#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

// Function Headers
vector<string> Separate_String (string inputSet);
void Generate_Subsets(vector<string> starting, vector<string> remaining);

// Global variable
ofstream outFile;

// MAIN PROGRAM
int _tmain(int argc, _TCHAR* argv[])
{
	string set;	// Raw input string

	vector <string> startelements; // All elements from the input string
	vector <string> endelements; // Elements that have not been used in subsets; initially 0
	endelements.push_back("");

	// Get input string and assign it to "set"
	cout << "Enter the set items as strings delimited by commas (,)";
	getline(cin, set);

	// Parse input string into vector<string> startelements
	startelements = Separate_String(set);
	
	// Open file to save results
	outFile.open("SUBSETS.txt");

	// Label output and start recursive call
	cout << "The subsets are: \n\n";
	outFile << "The subsets are: \n\n";
	Generate_Subsets(endelements, startelements);

	// Close file
	outFile << "\nEnd of subsets";
	outFile.close();

	// Pause program before closing
	cout << "\nPress any key to close...";
	cin.ignore();
	
	return 0;
}

// Function to separate raw string data into vector elements. String elements are
// parsed based on a delimiter (,)
vector<string> Separate_String(string inputSet)
{
	string temp = inputSet;
	vector <string> parsedElements;
	int position;

	while (temp.size() > 0)
	{
		position = temp.find(",");

		if (position > 0) // More than one element left
		{
			parsedElements.push_back(temp.substr(0, position));
			temp = temp.substr(position + 1);
		}
		else // Last element
		{
			parsedElements.push_back(temp);
			temp = "";
		}
	}

	return parsedElements;
}

// Recursive function to generate and print all subsets of the vector<string> set
// Based on the assumption that all previous results are correct. If there are more
// elements remaining that have not been added to the set, we examine the first 
// of these remaining items. It may or may not be in the subset we are creating.
// Therefore we create two new subsets - one with the new element and one without.
void Generate_Subsets(vector<string> starting, vector<string> remaining)
{
	if (remaining.size() > 0) // Unused elements
	{
		starting.push_back(remaining.at(0)); // Add one element to the current subset
		remaining.erase(remaining.begin()); // Remove element from unused item list

		Generate_Subsets(starting, remaining);

		starting.pop_back();	// Remove new element
		Generate_Subsets(starting, remaining);
	}
	// All elements in the set have been used, so print the result and return
	else 
	{
		for (int i = 0; i < starting.size(); i++) 
		{
			cout << starting[i] << " ";
			outFile << starting[i] << " ";
		}
		cout << "\n";
		outFile << "\n";
		return;
	}
}

