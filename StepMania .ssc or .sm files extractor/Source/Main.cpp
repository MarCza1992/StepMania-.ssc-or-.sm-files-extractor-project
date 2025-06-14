#include <iostream>
#include <string>
#include <vector>
#include <sstream>
#include <fstream>
#include <filesystem>
#include <taglib/tag.h>
#include <taglib/audioproperties.h>
#include <taglib/fileref.h>

using namespace std;

// Structure to hold chart information
struct Chart
{
	int ID = 0;
	string title;
	string subtitle;
	string artist;
	int length = 0;
	string MIN_BPM;
	string MAX_BPM;
	string technotation;
	string difficulty;
	int rating = 0;
	string stepartist;
	int Notes = 0;
	int LongNotes = 0;
	int Rolls = 0;
	int Mines = 0;
	string pack;
	string type;
};

<<<<<<< HEAD
<<<<<<< HEAD
// Convert a float to a string with two decimal places and replace '.' with ',' (mainly for BPM data)
string stringconversion(float value)
{
	string fixedvalue = to_string(value);
=======
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
string stringconversion(float value)
{
	string fixedvalue = to_string(value);

	fixedvalue = fixedvalue.substr(0, fixedvalue.find(".") + 3);
	fixedvalue = fixedvalue.replace(fixedvalue.find("."), 1, ",");

	return fixedvalue;
}

void DisplayChartsData(const vector<Chart>& baza)
{
	cout << "Chart_ID" << "|" << "Song_Title" << "|" << "Song_Subtitle" << "|" << "Song_Artist" << "|" << "Song_Length" << "|" << "Song_BPM" << "|" << "Technical_Notation" << "|" << "Difficulty_Name" << "|" << "Difficulty_Rating" << "|" << "Step_Artist" << "|" << "Amount_of_Notes" << "|" << "Amount_of_LongNotes" << "|" << "Amount_of_Rolls" << "|" << "Amount_of_Mines" << "|" << "Pack" << "|" << "Type" << endl;
<<<<<<< HEAD
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58

	fixedvalue = fixedvalue.substr(0, fixedvalue.find(".") + 3);
	fixedvalue = fixedvalue.replace(fixedvalue.find("."), 1, ",");

	return fixedvalue;
}

// Display the chart data on the console
void DisplayChartsData(const vector<Chart>& database)
{
	cout << "Chart_ID" << "|" << "Song_Title" << "|" << "Song_Subtitle" << "|" << "Song_Artist" << "|" << "Song_Length" << "|" << "MIN_BPM" << "|" << "MAX_BPM" << "|" << "Technical_Notation" << "|" << "Difficulty_Name" << "|" << "Difficulty_Rating" << "|" << "Step_Artist" << "|" << "Amount_of_Notes" << "|" << "Amount_of_LongNotes" << "|" << "Amount_of_Rolls" << "|" << "Amount_of_Mines" << "|" << "Pack" << "|" << "Type" << endl;

	for (size_t i = 0; i < database.size(); i++)
	{
<<<<<<< HEAD
<<<<<<< HEAD
		cout << database[i].ID << "|" << database[i].title << "|" << database[i].subtitle << "|" << database[i].artist << "|" << database[i].length << "|" << database[i].MIN_BPM << "|" << database[i].MAX_BPM << "|" << database[i].technotation << "|" << database[i].difficulty << "|" << database[i].rating << "|" << database[i].stepartist << "|" << database[i].Notes << "|" << database[i].LongNotes << "|" << database[i].Rolls << "|" << database[i].Mines << "|" << database[i].pack << "|" << database[i].type << endl;
=======
		cout << baza[i].ID << "|" << baza[i].title << "|" << baza[i].subtitle << "|" << baza[i].artist << "|" << baza[i].length << "|" << baza[i].BPM << "|" << baza[i].technotation << "|" << baza[i].difficulty << "|" << baza[i].rating << "|" << baza[i].charter << "|" << baza[i].Notes << "|" << baza[i].LongNotes << "|" << baza[i].Rolls << "|" << baza[i].Mines << "|" << baza[i].pack << "|" << baza[i].type << endl;
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
=======
		cout << baza[i].ID << "|" << baza[i].title << "|" << baza[i].subtitle << "|" << baza[i].artist << "|" << baza[i].length << "|" << baza[i].BPM << "|" << baza[i].technotation << "|" << baza[i].difficulty << "|" << baza[i].rating << "|" << baza[i].charter << "|" << baza[i].Notes << "|" << baza[i].LongNotes << "|" << baza[i].Rolls << "|" << baza[i].Mines << "|" << baza[i].pack << "|" << baza[i].type << endl;
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
	}
	cout << endl;
}

// Save chart data to "ChartsData.txt"
void SaveToChartsData(vector<Chart>& database)
{
	fstream file;
	file.open("ChartsData.txt", ios::out);

	if (!file.is_open())
	{
		cout << "File ChartsData.txt not found" << endl;
		return;
	}

<<<<<<< HEAD
<<<<<<< HEAD
	// header line
	file << "Chart_ID" << "|" << "Song_Title" << "|" << "Song_Subtitle" << "|" << "Song_Artist" << "|" << "Song_Length" << "|" << "MIN_BPM" << "|" << "MAX_BPM" << "|" << "Technical_Notation" << "|" << "Difficulty_Name" << "|" << "Difficulty_Rating" << "|" << "Step_Artist" << "|" << "Pack" << "|" << "Type" << endl;
=======
	plik << "Chart_ID" << "|" << "Song_Title" << "|" << "Song_Subtitle" << "|" << "Song_Artist" << "|" << "Song_Length" << "|" << "Song_BPM" << "|" << "Technical_Notation" << "|" << "Difficulty_Name" << "|" << "Difficulty_Rating" << "|" << "Step_Artist" << "|" << "Pack" << "|" << "Type" << endl;
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
=======
	plik << "Chart_ID" << "|" << "Song_Title" << "|" << "Song_Subtitle" << "|" << "Song_Artist" << "|" << "Song_Length" << "|" << "Song_BPM" << "|" << "Technical_Notation" << "|" << "Difficulty_Name" << "|" << "Difficulty_Rating" << "|" << "Step_Artist" << "|" << "Pack" << "|" << "Type" << endl;
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58

	// write every chart data
	for (size_t i = 0; i < database.size(); i++)
	{
<<<<<<< HEAD
<<<<<<< HEAD
		file << database[i].ID << "|" << database[i].title << "|" << database[i].subtitle << "|" << database[i].artist << "|" << database[i].length << "|" << database[i].MIN_BPM << "|" << database[i].MAX_BPM << "|" << database[i].technotation << "|" << database[i].difficulty << "|" << database[i].rating << "|" << database[i].stepartist << "|" << database[i].pack << "|" << database[i].type << endl;
=======
		plik << baza[i].ID << "|" << baza[i].title << "|" << baza[i].subtitle << "|" << baza[i].artist << "|" << baza[i].length << "|" << baza[i].BPM << "|" << baza[i].technotation << "|" << baza[i].difficulty << "|" << baza[i].rating << "|" << baza[i].charter << "|" << baza[i].pack << "|" << baza[i].type << endl;
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
=======
		plik << baza[i].ID << "|" << baza[i].title << "|" << baza[i].subtitle << "|" << baza[i].artist << "|" << baza[i].length << "|" << baza[i].BPM << "|" << baza[i].technotation << "|" << baza[i].difficulty << "|" << baza[i].rating << "|" << baza[i].charter << "|" << baza[i].pack << "|" << baza[i].type << endl;
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
	}
	cout << "Data saved to ChartsData.txt!" << endl << endl;
	file.close();
}

// Save note statistics to "NotesStats.txt"
void SaveToNotesStats(vector<Chart>& database)
{
	fstream file;
	file.open("NotesStats.txt", ios::out);

	if (!file.is_open())
	{
		cout << "File NotesStats.txt not found" << endl;
		return;
	}

	// Header line
	file << "Chart_ID" << "|" << "Amount_of_Notes" << "|" << "Amount_of_LongNotes" << "|" << "Amount_of_Rolls" << "|" << "Amount_of_Mines" << endl;

	// Write every chart note stats
	for (size_t i = 0; i < database.size(); i++)
	{
		file << database[i].ID << "|" << database[i].Notes << "|" << database[i].LongNotes << "|" << database[i].Rolls << "|" << database[i].Mines << endl;
	}
	cout << "Data saved to NotesData.txt!" << endl << endl;;
	file.close();
}

// Remove all '|' characters from a string to avoid messing up columns structure in table (I am using '|' as seperator)
void RemovePipes(string& text)
{
	while (text.find("|") != std::string::npos)
	{
		text.erase(text.find("|"), 1);
	}
}

// Parse a tag line by removing the tag prefix (taglength is the length of tag), ';' means end of every tag in those files, so if there is no information, ';' is right after the tag
string ParseTagLine(const string& line, const int& taglength)
{
	size_t start = taglength;
	size_t end = line.length() - 1;
	if (line.substr(start, 1) != ";")
	{
		return line.substr(start, end - start);
	}
	return "";
}

// Determine chart type based on string content (in short words, thats a game mode)
string ChartType(const string& line)
{
	if (line.find("dance-single") != string::npos) return "single";
	if (line.find("dance-double") != string::npos) return "double";
	if (line.find("dance-couple") != string::npos) return "couple";
	if (line.find("dance-solo") != string::npos) return "solo";
	if (line.find("pump-single") != string::npos) return "pump single";
	if (line.find("pump-double") != string::npos) return "pump double";
	return "other";
}

// Parse #DISPLAYBPM line and set min/max BPM in the chart
void ParseDisplayBPM(const string& line, Chart& chart)
{
	{
		float MINBPM = -1;
		float MAXBPM = -1;
		float tempo = -1;

		size_t start = line.find("#DISPLAYBPM:") + 12;
		size_t end = line.length() - 1;

		// If the first character after tag is not a digit, return (in very rare cases, some files have random characters after DISPLAYBPM tag for no reason)
		if (!isdigit(line[start]))
		{
			return;
		}

		string BPM = line.substr(start, end - start);

		// If BPM string contains a ':', parse min and max BPM (':' is a divider between min and max in those files)
		if (BPM.find(":") != string::npos)
		{
			if (BPM.find(":") == 1)
			{
				return;
			}
			MINBPM = stof(BPM.substr(0, BPM.find(":") - 1));
			MAXBPM = stof(BPM.substr(BPM.find(":") + 1, 10));
			string fixedmaxbpm = stringconversion(MAXBPM);
			string fixedminbpm = stringconversion(MINBPM);
			chart.MIN_BPM = fixedminbpm;
			chart.MAX_BPM = fixedmaxbpm;
		}
		else
		{
			// Single BPM tempo case, set both min and max to the same value
			tempo = stof(BPM);
			string fixedtempo = stringconversion(tempo);
			chart.MIN_BPM = fixedtempo;
			chart.MAX_BPM = fixedtempo;
		}
	}
}

// Parse #BPMS section of BPM lines to extract min and max BPM values
void ParseBPM(istream& file, string& line, Chart& chart)
{
	float tempo = -1;
	float MINBPM = -1;
	float MAXBPM = -1;
	float current = -1;

	// BPM value is always after the '=' (for example "10.000=100.000", where 10.000 is a measure line (we dont need it) and 100.000 is BPM value)
	size_t start = line.find("=") + 1;
	size_t end = line.length();
	tempo = stof(line.substr(start, end - start));

	// Check if the line contains both ';' and ',' (some files have whole BPM information in one single line divided by ",", its a very rare case, but must be considered)
	if (line.find(';') && line.find(','))
	{
		size_t start = line.find("#BPMS:") + 6;
		size_t end = line.length() - 1;
		string localline = line.substr(start, end - start);

		istringstream ss(localline);
		string linepart;

		// Iterate over each pair
		while (getline(ss, linepart, ','))
		{
			size_t linepartstart = linepart.find("=") + 1;
			size_t linepartend = linepart.length();
			tempo = stof(linepart.substr(linepartstart, linepartend - linepartstart));

			if (MINBPM == -1 && MAXBPM == -1)
			{
				MINBPM = tempo;
				MAXBPM = tempo;
			}
			else if (tempo < MINBPM)
			{
				MINBPM = tempo;
			}
			else if (tempo > MAXBPM)
			{
				MAXBPM = tempo;
			}
		}
		string fixedmaxbpm = stringconversion(MAXBPM);
		string fixedminbpm = stringconversion(MINBPM);
		chart.MIN_BPM = fixedminbpm;
		chart.MAX_BPM = fixedmaxbpm;
	}

	// Case with no ';' in line (multiline BPMs, thats how BPM is determined in most files, the ';' character is present on the last line of BPM section)
	else if (line.find(';') == string::npos)
	{
		while (getline(file, line))
		{
			if (line.find(";") != string::npos)
			{
				break;
			}

			size_t start = line.find("=") + 1;
			size_t end = line.length();
			current = stof(line.substr(start, end - start));

			if (current < tempo)
			{
				if (MINBPM == -1)
				{
					MINBPM = current;
				}
				if (current < MINBPM)
				{
					MINBPM = current;
				}
			}
			else
			{
				if (MAXBPM == -1)
				{
					MAXBPM = current;
				}
				if (current > MAXBPM)
				{
					MAXBPM = current;
				}
			}
		}
	}

	// Fix and assign BPMs if at least one value was found
	if (MAXBPM != -1 || MINBPM != -1)
	{
		if (MAXBPM == -1)
		{
			string fixedminbpm = stringconversion(MINBPM);
			string fixedtempo = stringconversion(tempo);
			chart.MIN_BPM = fixedminbpm;
			chart.MAX_BPM = fixedtempo;
		}
		else
		{
			string fixedmaxbpm = stringconversion(MAXBPM);
			string fixedtempo = stringconversion(tempo);
			chart.MIN_BPM = fixedtempo;
			chart.MAX_BPM = fixedmaxbpm;
		}
	}

	// case if both values were found
	if (MAXBPM != -1 && MINBPM != -1)
	{
		string fixedmaxbpm = stringconversion(MAXBPM);
		string fixedminbpm = stringconversion(MINBPM);
		chart.MIN_BPM = fixedminbpm;
		chart.MAX_BPM = fixedmaxbpm;
	}

	// If no BPM values found, assign tempo to both min and max BPM
	if (MAXBPM == -1 && MINBPM == -1)
	{
		string fixedtempo = stringconversion(tempo);
		chart.MIN_BPM = fixedtempo;
		chart.MAX_BPM = fixedtempo;
	}
}

// Parse notes section from input stream and count notes of different types in chart for notes statistics purpose
void ParseNotes(std::istream& file, Chart& chart)
{
	int NotesAmount = 0;
	int LongNotesAmount = 0;
	int RollsAmount = 0;
	int MinesAmount = 0;

	string line;
	while (std::getline(file, line))
	{
		// Stop if line contains ';' (end of notes section)
		if (line.find(";") != std::string::npos)
		{
			break;
		}

		// Skip lines containing "measure" (some files has lines like 'measure 1', I dont want that number or 'M' to be counted in statistics, because its not valid)
		if (line.find("measure") != std::string::npos)
		{
			continue;
		}

		// Count different types of notes based on characters (example line '011M', '0' means that there is no object, 'M' means mine and '1' means note, so we have 2 notes and 1 mine in that line)
		for (char c : line)
		{
			switch (c)
			{
			case '1': NotesAmount++; break;
			case '2': LongNotesAmount++; break;
			case '4': RollsAmount++; break;
			case 'M': MinesAmount++; break;
			case '0': break; // No note
			case '3': break; // 3 is a ending spot for a LongNote (consider it as a end of a tail), ending of a long note isnt a additional object (just a information where LongNote ends), so we dont need it
			default: break;
			}
		}
	}
	// Assign counted values to chart
	chart.Notes = NotesAmount;
	chart.LongNotes = LongNotesAmount;
	chart.Rolls = RollsAmount;
	chart.Mines = MinesAmount;
}

// -----------------------------------------------------------------------------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------

int main()
{
	vector<Chart> ChartsDatabase;
	Chart chart;
	int currentID = 1;

	string SourceFolder = "Packs";
	
	if (!filesystem::exists(SourceFolder) || !filesystem::is_directory(SourceFolder))
	{
		cout << "Folder 'Packs' not found!" << endl;
		return 1;
	}

	// iterating each folder in main "Packs" folder to find paths for audio files (mp3 or ogg) and sm/ssc files in each chart folder (Packs -> Pack -> Chart Folder -> audio and sm/ssc files)
	for (const auto& ChartsPack : filesystem::directory_iterator(SourceFolder))
	{
		if (filesystem::is_directory(ChartsPack))
		{
			string PackName = ChartsPack.path().filename().string();

			for (const auto& ChartFolder : filesystem::directory_iterator(ChartsPack))
			{
				if (filesystem::is_directory(ChartFolder))
				{
					wstring ChartName = ChartFolder.path().filename().wstring();
					wstring sscpath, oggpath, smpath;

					for (const auto& file : filesystem::directory_iterator(ChartFolder))
					{
						if (file.path().extension() == ".ssc" || file.path().extension() == ".SSC")
						{
							sscpath = file.path().wstring();
						}

						if (file.path().extension() == ".ogg" || file.path().extension() == ".mp3")
						{
							oggpath = file.path().wstring();
						}

						if (file.path().extension() == ".sm" || file.path().extension() == ".SM")
						{
							smpath = file.path().wstring();
						}
					}

					// getting song length from the chart (there is no information about song length in sm/ssc files, so we have to use audio file to extract that)
					if (!oggpath.empty())
					{
						TagLib::FileRef audio(oggpath.c_str());
						if (!audio.isNull() && audio.audioProperties())
						{
							chart.length = audio.audioProperties()->lengthInSeconds();
						}
						else
						{
							cout << "Audio data not found in file: " << PackName << " - " << ChartName << endl;
						}
					}
					
					// if both files (sm and ssc) are present in the Chart Folder, we prioritize a ssc file because it has more clean structure than sm file
					if (!sscpath.empty())
					{
						fstream file;

						file.open(sscpath, ios::in);
						if (!file.is_open())
						{
<<<<<<< HEAD
<<<<<<< HEAD
							cout << ".ssc file not found in " << ChartName << " folder" << endl;
=======
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
							cout << ".ssc file not found in" << ChartName << " folder" << endl;
							return 1;
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
						}

						string line;
						int checkbpm = 0; // just for BPM tag to avoid overwriting information about BPM for multiple difficulties in chart

						while (getline(file, line))
						{
							// some files (rare case) have a BOM on a beginning of file
							if (line.compare(0, 3, "\xEF\xBB\xBF") == 0)
							{
								line.erase(0, 3);
							}

							if (line.find("#TITLE:") == 0)
							{
								chart.ID = currentID++;
								chart.pack = PackName;

								chart.title = ParseTagLine(line, 7);
								RemovePipes(chart.title);
							}

<<<<<<< HEAD
							if (line.find("#STEPSTYPE:") == 0)
=======
							if (linia.find("#STEPSTYPE:") == 0)
							{
								if (linia.find("single") != string::npos)
								{
									chart.type = "single";
								}
								else
								{
									chart.type = "double";
								}
							}

							if (linia.find("#STEPSTYPE:") == 0)
							{
								if (linia.find("single") != string::npos)
								{
									chart.type = "single";
								}
								else
								{
									chart.type = "double";
								}
							}

							if (linia.find("#TITLETRANSLIT:") == 0)
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
							{
								chart.type = ChartType(line);
							}

							// #TITLETRANSLIT is prioritized over #TITLE (it provides the romanized title of a song that contains, for example, Japanese characters)
							if (line.find("#TITLETRANSLIT:") == 0)
							{
<<<<<<< HEAD
								string result = ParseTagLine(line, 15);
								if (!result.empty())
								{
									chart.title = result;
								}
								RemovePipes(chart.title);
							}

							// if its empty, we put a " " to make it more readable between '|' in console
							if (line.find("#SUBTITLE:") == 0)
							{
								chart.subtitle = ParseTagLine(line, 10);
								if (chart.subtitle.empty())
=======
								size_t start = linia.find("#SUBTITLE:") + 10;
								size_t end = linia.length() - 1;
								if (linia.substr(start, 1) == ";")
<<<<<<< HEAD
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
								{
									chart.subtitle = " ";
								}
								RemovePipes(chart.subtitle);
							}

							if (line.find("#SUBTITLETRANSLIT:") == 0)
							{
<<<<<<< HEAD
								string result = ParseTagLine(line, 18);
								if (!result.empty())
=======
								size_t start = linia.find("#SUBTITLETRANSLIT:") + 18;
								size_t end = linia.length() - 1;
								if (linia.substr(start, 1) != ";")
<<<<<<< HEAD
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
								{
									chart.subtitle = result;
								}
								RemovePipes(chart.subtitle);
							}

							if (line.find("#ARTIST:") == 0)
							{
								chart.artist = ParseTagLine(line, 8);
								RemovePipes(chart.artist);
							}

							if (line.find("#ARTISTTRANSLIT:") == 0)
							{
<<<<<<< HEAD
								string result = ParseTagLine(line, 16);
								if (!result.empty())
=======
								size_t start = linia.find("#ARTISTTRANSLIT:") + 16;
								size_t end = linia.length() - 1;
								if (linia.substr(start, 1) != ";")
<<<<<<< HEAD
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
								{
									chart.artist = result;
								}
								RemovePipes(chart.artist);
							}

							if (line.find("#BPMS:") == 0)
							{
								if (checkbpm != 1)
								{
<<<<<<< HEAD
									ParseBPM(file, line, chart);
=======

									float tempo = -1;
									float MINBPM = -1;
									float MAXBPM = -1;
									float current = -1;

									size_t start = linia.find("=") + 1;
									size_t end = linia.length();
									tempo = stof(linia.substr(start, end - start));

									while (getline(plik, linia))
									{

										if (linia.find(";") != string::npos)
										{
											break;
										}

										size_t start = linia.find("=") + 1;
										size_t end = linia.length();
										current = stof(linia.substr(start, end - start));

										if (current < tempo)
										{
											if (MINBPM == -1)
											{
												MINBPM = current;
											}
											if (current < MINBPM)
											{
												MINBPM = current;
											}
										}
										else
										{
											if (MAXBPM == -1)
											{
												MAXBPM = current;
											}
											if (current > MAXBPM)
											{
												MAXBPM = current;
											}
										}
									}

									if (MAXBPM != -1 || MINBPM != -1)
									{
										if (MAXBPM == -1)
										{
											string fixedminbpm = stringconversion(MINBPM);
											string fixedtempo = stringconversion(tempo);
											chart.BPM = fixedminbpm + " - " + fixedtempo;
										}
										else
										{
											string fixedmaxbpm = stringconversion(MAXBPM);
											string fixedtempo = stringconversion(tempo);
											chart.BPM = fixedtempo + " - " + fixedmaxbpm;
										}
									}

									if (MAXBPM != -1 && MINBPM != -1)
									{
										string fixedmaxbpm = stringconversion(MAXBPM);
										string fixedminbpm = stringconversion(MINBPM);
										chart.BPM = fixedminbpm + " - " + fixedmaxbpm;
									}

									if (MAXBPM == -1 && MINBPM == -1)
									{
										string fixedtempo = stringconversion(tempo);
										chart.BPM = fixedtempo;
									}
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
									checkbpm++;
								}
							}

							if (line.find("#DISPLAYBPM:") == 0)
							{
<<<<<<< HEAD
<<<<<<< HEAD
								ParseDisplayBPM(line, chart);
=======
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
								float MINBPM = -1;
								float MAXBPM = -1;
								float tempo = -1;

								size_t start = linia.find("#DISPLAYBPM:") + 12;
								size_t end = linia.length() - 1;

								if (linia.substr(start, 1) == ";")
								{
									continue;
								}

								chart.BPM = linia.substr(start, end - start);

								if (chart.BPM.find(":") != string::npos)
								{
									MINBPM = stof(chart.BPM.substr(0, chart.BPM.find(":") - 1));
									MAXBPM = stof(chart.BPM.substr(chart.BPM.find(":") + 1, 10));
									string fixedmaxbpm = stringconversion(MAXBPM);
									string fixedminbpm = stringconversion(MINBPM);
									chart.BPM = fixedminbpm + " - " + fixedmaxbpm;
<<<<<<< HEAD
=======
								}
								else
								{
									tempo = stof(chart.BPM);
									string fixedtempo = stringconversion(tempo);
									chart.BPM = fixedtempo;
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
								}
								else
								{
									tempo = stof(chart.BPM);
									string fixedtempo = stringconversion(tempo);
									chart.BPM = fixedtempo;
								}
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
							}

							// copying unique data to next difficulty of a chart
							if (line.find("#NOTEDATA:") == 0)
							{
								if (chart.title.empty())
								{
									chart.ID = currentID++;
									chart.title = ChartsDatabase.back().title;
									chart.subtitle = ChartsDatabase.back().subtitle;
									chart.artist = ChartsDatabase.back().artist;
									chart.length = ChartsDatabase.back().length;
									chart.MIN_BPM = ChartsDatabase.back().MIN_BPM;
									chart.MAX_BPM = ChartsDatabase.back().MAX_BPM;
									chart.pack = ChartsDatabase.back().pack;
									chart.stepartist = ChartsDatabase.back().stepartist;
								}
							}

							if (line.find("#DESCRIPTION:") == 0)
							{
								if (chart.title.empty())
								{
									chart.ID = currentID++;
									chart.title = ChartsDatabase.back().title;
									chart.subtitle = ChartsDatabase.back().subtitle;
									chart.artist = ChartsDatabase.back().artist;
									chart.length = ChartsDatabase.back().length;
									chart.MIN_BPM = ChartsDatabase.back().MIN_BPM;
									chart.MAX_BPM = ChartsDatabase.back().MAX_BPM;
									chart.pack = ChartsDatabase.back().pack;
									chart.stepartist = ChartsDatabase.back().stepartist;
								}

<<<<<<< HEAD
								chart.technotation = ParseTagLine(line, 13);
								if (chart.technotation.empty())
=======
								size_t start = linia.find("#DESCRIPTION:") + 13;
								size_t end = linia.length() - 1;
								if (linia.substr(start, 1) != ";")
<<<<<<< HEAD
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
								{
									chart.technotation = " ";
								}
								RemovePipes(chart.subtitle);
							}

							if (line.find("#DIFFICULTY:") == 0)
							{
								chart.difficulty = ParseTagLine(line, 12);
							}

							if (line.find("#METER:") == 0)
							{
								chart.rating = stoi(ParseTagLine(line, 7));
							}

							if (line.find("#CREDIT:") == 0)
							{
								chart.stepartist = ParseTagLine(line, 8);
								RemovePipes(chart.stepartist);
							}

							if (line.find("#NOTES:") == 0)
							{
								ParseNotes(file, chart);

								// some files have wrongly placed information about step artist and tech notation (human mistakes), so its standarized here
								if (chart.stepartist.empty())
								{
									chart.stepartist = chart.technotation;
									chart.technotation = " ";
								}

								if (chart.stepartist == chart.technotation)
								{
									chart.technotation = " ";
								}

								// pushing whole information about chart to ChartsDatabase
								ChartsDatabase.push_back(chart);
								chart = Chart();
							}
						}
						file.close();
					}

					//similar operation for sm file (if ssc wasnt found)
					else if (!smpath.empty())
					{
						fstream file;

						file.open(smpath, ios::in);
						if (!file.is_open())
						{
							cout << ".sm file not found in " << ChartName << " folder" << endl;
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
							return 1;
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
						}

						string line;

						while (getline(file, line))
						{
							if (line.compare(0, 3, "\xEF\xBB\xBF") == 0)
							{
								line.erase(0, 3);
							}

							if (line.find("#TITLE:") == 0)
							{
								chart.ID = currentID++;
								chart.pack = PackName;

								chart.title = ParseTagLine(line, 7);
								RemovePipes(chart.title);
							}

							if (line.find("#TITLETRANSLIT:") == 0)
							{
<<<<<<< HEAD
								string result = ParseTagLine(line, 15);
								if (!result.empty())
=======
								size_t start = linia.find("#TITLETRANSLIT:") + 15;
								size_t end = linia.length() - 1;
								if (linia.substr(start, 1) != ";")
<<<<<<< HEAD
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
								{
									chart.title = result;
								}
								RemovePipes(chart.title);
							}

							if (line.find("#SUBTITLE:") == 0)
							{
<<<<<<< HEAD
								chart.subtitle = ParseTagLine(line, 10);
								if (chart.subtitle.empty())
=======
								size_t start = linia.find("#SUBTITLE:") + 10;
								size_t end = linia.length() - 1;
								if (linia.substr(start, 1) == ";")
<<<<<<< HEAD
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
								{
									chart.subtitle = " ";
								}
								RemovePipes(chart.subtitle);
							}

							if (line.find("#SUBTITLETRANSLIT:") == 0)
							{
								string result = ParseTagLine(line, 18);
								if (!result.empty())
								{
									chart.subtitle = result;
								}
								RemovePipes(chart.subtitle);
							}

							if (line.find("#ARTIST:") == 0)
							{
								chart.artist = ParseTagLine(line, 8);
								RemovePipes(chart.artist);
							}

							if (line.find("#ARTISTTRANSLIT:") == 0)
							{
								string result = ParseTagLine(line, 16);
								if (!result.empty())
								{
									chart.artist = result;
								}
								RemovePipes(chart.artist);
							}

							if (line.find("#DISPLAYBPM:") == 0)
							{
								ParseDisplayBPM(line, chart);
							}

							if (line.find("#BPMS:") == 0)
							{
								if (chart.MIN_BPM.empty())
								{
									ParseBPM(file, line, chart);
								}
							}

							if (line.find("#CREDIT:") == 0)
							{
<<<<<<< HEAD
								chart.stepartist = ParseTagLine(line, 8);
=======
								size_t start = linia.find("#SUBTITLETRANSLIT:") + 18;
								size_t end = linia.length() - 1;
								if (linia.substr(start, 1) != ";")
								{
									chart.subtitle = linia.substr(start, end - start);
								}

								if (chart.subtitle.find("|") != string::npos)
								{
									chart.subtitle.erase(chart.subtitle.find("|"), 1);
								}
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
							}

							// some very old files have that kind of information on beginning, that is useless and its messing up whole extraction process, fixing it here
							if (line.find("//---") == 0)
							{
<<<<<<< HEAD
								if (line.find("song ID:") != string::npos || line.find("song id:") != string::npos)
=======
								size_t start = linia.find("#ARTIST:") + 8;
								size_t end = linia.length() - 1;
								chart.artist = linia.substr(start, end - start);

								if (chart.artist.find("|") != string::npos)
								{
									chart.artist.erase(chart.artist.find("|"), 1);
								}
							}

							if (linia.find("#ARTISTTRANSLIT:") == 0)
							{
								size_t start = linia.find("#ARTISTTRANSLIT:") + 16;
								size_t end = linia.length() - 1;
								if (linia.substr(start, 1) != ";")
								{
									chart.artist = linia.substr(start, end - start);
								}

								if (chart.artist.find("|") != string::npos)
								{
									chart.artist.erase(chart.artist.find("|"), 1);
								}
							}

							if (linia.find("#DISPLAYBPM:") == 0)
							{
								float MINBPM = -1;
								float MAXBPM = -1;
								float tempo = -1;

								size_t start = linia.find("#DISPLAYBPM:") + 12;
								size_t end = linia.length() - 1;
								
								if (linia.substr(start, 1) == ";")
<<<<<<< HEAD
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
=======
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
								{
									continue;
								}

<<<<<<< HEAD
=======
								chart.BPM = linia.substr(start, end - start);

								if (chart.BPM.find(":") != string::npos)
								{
									MINBPM = stof(chart.BPM.substr(0, chart.BPM.find(":") - 1));
									MAXBPM = stof(chart.BPM.substr(chart.BPM.find(":") + 1, 10));
									string fixedmaxbpm = stringconversion(MAXBPM);
									string fixedminbpm = stringconversion(MINBPM);
									chart.BPM = fixedminbpm + " - " + fixedmaxbpm;
								}
								else
								{
									tempo = stof(chart.BPM);
									string fixedtempo = stringconversion(tempo);
									chart.BPM = fixedtempo;
								}
							}

							if (linia.find("#BPMS:") == 0)
							{
								if (chart.BPM.empty())
								{

									float tempo = -1;
									float MINBPM = -1;
									float MAXBPM = -1;
									float current = -1;

									size_t start = linia.find("=") + 1;
									size_t end = linia.length();
									tempo = stof(linia.substr(start, end - start));


									while (getline(plik, linia))
									{

										if (linia.find(";") != string::npos)
										{
											break;
										}

										size_t start = linia.find("=") + 1;
										size_t end = linia.length();
										current = stof(linia.substr(start, end - start));

										if (current < tempo)
										{
											if (MINBPM == -1)
											{
												MINBPM = current;
											}
											if (current < MINBPM)
											{
												MINBPM = current;
											}
										}
										else
										{
											if (MAXBPM == -1)
											{
												MAXBPM = current;
											}
											if (current > MAXBPM)
											{
												MAXBPM = current;
											}
										}
									}

									if (MAXBPM != -1 || MINBPM != -1)
									{
										if (MAXBPM == -1)
										{
											string fixedminbpm = stringconversion(MINBPM);
											string fixedtempo = stringconversion(tempo);
											chart.BPM = fixedminbpm + " - " + fixedtempo;
										}
										else
										{
											string fixedmaxbpm = stringconversion(MAXBPM);
											string fixedtempo = stringconversion(tempo);
											chart.BPM = fixedtempo + " - " + fixedmaxbpm;
										}
									}

									if (MAXBPM != -1 && MINBPM != -1)
									{
										string fixedmaxbpm = stringconversion(MAXBPM);
										string fixedminbpm = stringconversion(MINBPM);
										chart.BPM = fixedminbpm + " - " + fixedmaxbpm;
									}

									if (MAXBPM == -1 && MINBPM == -1)
									{
										string fixedtempo = stringconversion(tempo);
										chart.BPM = fixedtempo;
									}
								}
							}

							if (linia.find("#CREDIT:") == 0)
							{
								size_t start = linia.find("#CREDIT:") + 8;
								size_t end = linia.length() - 1;
								chart.charter = linia.substr(start, end - start);

								if (chart.charter.find("|") != string::npos)
								{
									chart.charter.erase(chart.charter.find("|"), 1);
								}
							}

							if (linia.find("//---") == 0)
							{
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
								if (chart.title.empty())
								{
									chart.ID = currentID++;
									chart.title = ChartsDatabase.back().title;
									chart.subtitle = ChartsDatabase.back().subtitle;
									chart.artist = ChartsDatabase.back().artist;
									chart.length = ChartsDatabase.back().length;
									chart.MIN_BPM = ChartsDatabase.back().MIN_BPM;
									chart.MAX_BPM = ChartsDatabase.back().MAX_BPM;
									chart.pack = ChartsDatabase.back().pack;
								}

								if (chart.stepartist.empty())
								{
									size_t start = line.find("//---") + 32;
									size_t end = line.length() - 16;
									chart.stepartist = line.substr(start, end - start);

									if (chart.stepartist.find("----") != string::npos)
									{
										chart.stepartist = " ";
									}

									RemovePipes(chart.stepartist);
								}
							}

							// this is the trickiest part of the sm file, with a lot of inconsistencies across different files. I have tried to account for most of them by checking a lot of files and their structures. This version likely handles 99.9% of cases
							if (line.find("#NOTES:") == 0)
							{
								int linenumber = 1;

								if (line != "#NOTES:")
								{
<<<<<<< HEAD
<<<<<<< HEAD
									if (chart.title.empty())
=======
									if (numerlinii == 1)
									{
										if (linia.find("single") != string::npos)
=======
									if (numerlinii == 1)
									{
										if (linia.find("single") != string::npos)
										{
											chart.type = "single";
											numerlinii++;
											continue;
										}
										else
										{
											chart.type = "double";
											numerlinii++;
											continue;
										}
									}

									if (numerlinii == 2)
									{
										size_t start = 5;
										size_t end = linia.length() - 1;

										if (linia.substr(start, 1) == ":")
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
										{
											chart.type = "single";
											numerlinii++;
											continue;
										}
										else
										{
											chart.type = "double";
											numerlinii++;
											continue;
										}
									}

									if (numerlinii == 2)
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
									{
										chart.ID = currentID++;
										chart.title = ChartsDatabase.back().title;
										chart.subtitle = ChartsDatabase.back().subtitle;
										chart.artist = ChartsDatabase.back().artist;
										chart.length = ChartsDatabase.back().length;
										chart.MIN_BPM = ChartsDatabase.back().MIN_BPM;
										chart.MAX_BPM = ChartsDatabase.back().MAX_BPM;
										chart.pack = ChartsDatabase.back().pack;
									}

<<<<<<< HEAD
									stringstream ss(line);
									string linepart;

									getline(ss, linepart, ':');
									getline(ss, linepart, ':');
									chart.type = ChartType(linepart);

									getline(ss, linepart, ':');
									RemovePipes(linepart);
									chart.stepartist = linepart;

									getline(ss, chart.difficulty, ':');
									getline(ss, linepart, ':');
									chart.rating = stoi(linepart);

									ParseNotes(file, chart);

									chart.technotation = " ";

									if (!ChartsDatabase.empty() && ChartsDatabase.back().title == chart.title && (chart.stepartist.find_first_not_of(' ') == string::npos || chart.stepartist == "Beginner" || chart.stepartist == "Easy" || chart.stepartist == "Medium" || chart.stepartist == "Hard" || chart.stepartist == "Challenge" || chart.stepartist == "Edit"))
									{
										chart.stepartist = ChartsDatabase.back().stepartist;
									}

									if (chart.title.empty())
									{
										chart.ID = currentID++;
										chart.title = ChartsDatabase.back().title;
										chart.subtitle = ChartsDatabase.back().subtitle;
										chart.artist = ChartsDatabase.back().artist;
										chart.length = ChartsDatabase.back().length;
										chart.MIN_BPM = ChartsDatabase.back().MIN_BPM;
										chart.MAX_BPM = ChartsDatabase.back().MAX_BPM;
										chart.pack = ChartsDatabase.back().pack;
									}

									ChartsDatabase.push_back(chart);
									chart = Chart();
								}
								
								else
								{
									while (getline(file, line) && linenumber <= 4)
									{
										if (linenumber == 1)
=======
										if (linia.substr(start, 1) == ":")
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
										{
											chart.type = ChartType(line);
											linenumber++;
											continue;
										}

										if (linenumber == 2)
										{
											size_t start = 5;
											size_t end = line.length() - 1;

<<<<<<< HEAD
											if (line.substr(start, 1) == ":")
											{
												linenumber++;
												continue;
											}

											chart.stepartist = line.substr(start, end - start);
											RemovePipes(chart.stepartist);
										}

										if (linenumber == 3)
										{
											chart.difficulty = ParseTagLine(line, 5);
										}

										if (linenumber == 4)
										{
											chart.rating = stoi(ParseTagLine(line, 5));
										}
										linenumber++;
									}
									ParseNotes(file, chart);
									chart.technotation = " ";

									if (!ChartsDatabase.empty() && ChartsDatabase.back().title == chart.title && (chart.stepartist.find_first_not_of(' ') == string::npos || chart.stepartist == "Beginner" || chart.stepartist == "Easy" || chart.stepartist == "Medium" || chart.stepartist == "Hard" || chart.stepartist == "Challenge" || chart.stepartist == "Edit"))
									{
										chart.stepartist = ChartsDatabase.back().stepartist;
									}

									if (chart.stepartist.empty())
									{
										chart.stepartist = " ";
									}

									if (chart.title.empty())
									{
										chart.ID = currentID++;
										chart.title = ChartsDatabase.back().title;
										chart.subtitle = ChartsDatabase.back().subtitle;
										chart.artist = ChartsDatabase.back().artist;
										chart.length = ChartsDatabase.back().length;
										chart.MIN_BPM = ChartsDatabase.back().MIN_BPM;
										chart.MAX_BPM = ChartsDatabase.back().MAX_BPM;
										chart.pack = ChartsDatabase.back().pack;
									}

									ChartsDatabase.push_back(chart);
									chart = Chart();
								}
=======
								if (chart.charter.find_first_not_of(' ') == string::npos)
								{
									chart.charter = BazaChartow.back().charter;
								}

								if (chart.charter.find_first_not_of(' ') == string::npos)
								{
									chart.charter = BazaChartow.back().charter;
								}

								BazaChartow.push_back(chart);
								chart = Chart();
>>>>>>> aae0036a4ba722a77714208e6988ab92c38e8e58
							}
						}
						file.close();
					}
				}
			}
		}
	}

	// console menu
	int option = 0;
	do
	{
		cout << "===STEPMANIA .SSC/.SM FILES EXTRACTOR===" << endl;
		cout << "Choose option:" << endl;
		cout << "1 - display results" << endl;
		cout << "2 - save results to ChartsData.txt and NotesData.txt" << endl;
		cout << "3 - close program" << endl;
		cin >> option;
		if (cin.fail())
		{
			cin.clear();
			cin.ignore(10000, '\n');
		}
		switch (option)
		{
		case 1: DisplayChartsData(ChartsDatabase); break;
		case 2:
			{
				SaveToChartsData(ChartsDatabase);
				SaveToNotesStats(ChartsDatabase);
				break;
			}
		case 3: cout << "closing program..." << endl; break;
		default: cout << "wrong option, try again" << endl; break;
		}
	} while (option != 3);

	cin.get();
}