#include <iostream>
#include <string>
#include <vector>
#include <fstream>
#include <filesystem>
#include <taglib/tag.h>
#include <taglib/audioproperties.h>
#include <taglib/fileref.h>

using namespace std;

struct Chart
{
	int ID = 0;
	string title;
	string subtitle;
	string artist;
	int length = 0;
	string BPM;
	string technotation;
	string difficulty;
	int rating = 0;
	string charter;
	int Notes = 0;
	int LongNotes = 0;
	int Rolls = 0;
	int Mines = 0;
	string pack;
};

void DisplayChartsData(const vector<Chart>& baza)
{
	for (size_t i = 0; i < baza.size(); i++)
	{
		cout << baza[i].ID << "|" << baza[i].title << "|" << baza[i].subtitle << "|" << baza[i].artist << "|" << baza[i].length << "|" << baza[i].BPM << "|" << baza[i].technotation << "|" << baza[i].difficulty << "|" << baza[i].rating << "|" << baza[i].charter << "|" << baza[i].Notes << "|" << baza[i].LongNotes << "|" << baza[i].Rolls << "|" << baza[i].Mines << "|" << baza[i].pack << endl;
	}
	cout << endl;
}

void SaveToChartsData(vector<Chart>& baza)
{
	fstream plik;
	plik.open("ChartsData.txt", ios::out);

	if (!plik.is_open())
	{
		cout << "File ChartsData.txt not found" << endl;
		return;
	}

	plik << "Chart_ID" << "|" << "Song_Title" << "|" << "Song_Subtitle" << "|" << "Song_Artist" << "|" << "Song_Length" << "|" << "Song_BPM" << "|" << "Technical_Notation" << "|" << "Difficulty_Name" << "|" << "Difficulty_Rating" << "|" << "Step_Artist" << "|" << "Pack" << endl;

	for (size_t i = 0; i < baza.size(); i++)
	{
		plik << baza[i].ID << "|" << baza[i].title << "|" << baza[i].subtitle << "|" << baza[i].artist << "|" << baza[i].length << "|" << baza[i].BPM << "|" << baza[i].technotation << "|" << baza[i].difficulty << "|" << baza[i].rating << "|" << baza[i].charter << "|" << baza[i].pack << endl;
	}
	cout << "Data saved to ChartsData.txt!" << endl << endl;
	plik.close();
	
}

void SaveToNotesStats(vector<Chart>& baza)
{
	fstream plik;
	plik.open("NotesStats.txt", ios::out);

	if (!plik.is_open())
	{
		cout << "File NotesStats.txt not found" << endl;
		return;
	}

	plik << "Chart_ID" << "|" << "Amount_of_Notes" << "|" << "Amount_of_LongNotes" << "|" << "Amount_of_Rolls" << "|" << "Amount_of_Mines" << endl;

	for (size_t i = 0; i < baza.size(); i++)
	{
		plik << baza[i].ID << "|" << baza[i].Notes << "|" << baza[i].LongNotes << "|" << baza[i].Rolls << "|" << baza[i].Mines << endl;
	}
	cout << "Data saved to NotesData.txt!" << endl << endl;;
	plik.close();
}

int main()
{
	vector<Chart> BazaChartow;
	Chart chart;
	int currentID = 1;

	string SourceFolder = "Packs";
	
	if (!filesystem::exists(SourceFolder) || !filesystem::is_directory(SourceFolder))
	{
		cout << "Folder 'Packs' nie istnieje" << endl;
		return 1;
	}

	for (const auto& ChartsPack : filesystem::directory_iterator(SourceFolder))
	{
		if (filesystem::is_directory(ChartsPack))
		{
			string PackName = ChartsPack.path().filename().string();

			for (const auto& ChartFolder : filesystem::directory_iterator(ChartsPack))
			{
				if (filesystem::is_directory(ChartFolder))
				{
					string ChartName = ChartFolder.path().filename().string();
					string sscpath, oggpath;

					for (const auto& file : filesystem::directory_iterator(ChartFolder))
					{
						if (file.path().extension() == ".ssc")
						{
							sscpath = file.path().string();
						}

						if (file.path().extension() == ".ogg" || file.path().extension() == ".mp3")
						{
							oggpath = file.path().string();
						}
					}

					if (!oggpath.empty())
					{
						TagLib::FileRef audio(oggpath.c_str());
						if (!audio.isNull() && audio.audioProperties())
						{
							chart.length = audio.audioProperties()->lengthInSeconds();
						}
						else
						{
							cout << "Brak danych audio w pliku: " << PackName << " - " << ChartName << endl;
						}
					}
					

					if (!sscpath.empty())
					{
						fstream plik;

						plik.open(sscpath, ios::in);
						if (!plik.is_open())
						{
							cout << "pliku nie znaleziono" << endl;
							return 1;
						}

						string linia;
						int checkcredits = 0;
						int checkbpm = 0;

						while (getline(plik, linia))
						{
							if (linia.find("#TITLE:") == 0)
							{
								chart.ID = currentID++;
								
								chart.pack = PackName;

								size_t start = linia.find("#TITLE:") + 7;
								size_t end = linia.length() - 1;
								chart.title = linia.substr(start, end - start);

								if (chart.title.find("|") != string::npos)
								{
									chart.title.erase(chart.title.find("|"), 1);
								}
							}

							if (linia.find("#TITLETRANSLIT:") == 0)
							{
								size_t start = linia.find("#TITLETRANSLIT:") + 15;
								size_t end = linia.length() - 1;
								if (linia.substr(start, (end - start) + 1) != ";")
								{
									chart.title = linia.substr(start, end - start);
								}

								if (chart.title.find("|") != string::npos)
								{
									chart.title.erase(chart.title.find("|"), 1);
								}
							}

							if (linia.find("#SUBTITLE:") == 0)
							{
								size_t start = linia.find("#SUBTITLE:") + 10;
								size_t end = linia.length() - 1;
								if (linia.substr(start, (end - start) + 1) == ";")
								{
									chart.subtitle = " ";
								}
								else
								{
									chart.subtitle = linia.substr(start, end - start);
								}

								if (chart.subtitle.find("|") != string::npos)
								{
									chart.subtitle.erase(chart.subtitle.find("|"), 1);
								}
							}

							if (linia.find("#SUBTITLETRANSLIT:") == 0)
							{
								size_t start = linia.find("#SUBTITLETRANSLIT:") + 18;
								size_t end = linia.length() - 1;
								if (linia.substr(start, (end - start) + 1) != ";")
								{
									chart.subtitle = linia.substr(start, end - start);
								}

								if (chart.subtitle.find("|") != string::npos)
								{
									chart.subtitle.erase(chart.subtitle.find("|"), 1);
								}
							}

							if (linia.find("#ARTIST:") == 0)
							{
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
								if (linia.substr(start, (end - start) + 1) != ";")
								{
									chart.artist = linia.substr(start, end - start);
								}

								if (chart.artist.find("|") != string::npos)
								{
									chart.artist.erase(chart.artist.find("|"), 1);
								}
							}

							if (linia.find("#BPMS:") == 0)
							{
								if (checkbpm != 1)
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
											chart.BPM = to_string(MINBPM) + " - " + to_string(tempo);
										}
										else
										{
											chart.BPM = to_string(tempo) + " - " + to_string(MAXBPM);
										}
									}

									if (MAXBPM != -1 && MINBPM != -1)
									{
										chart.BPM = to_string(MINBPM) + " - " + to_string(MAXBPM);
									}

									if (MAXBPM == -1 && MINBPM == -1)
									{
										chart.BPM = to_string(tempo);
									}
									checkbpm++;
								}
							}

							if (linia.find("#DISPLAYBPM:") == 0)
							{
								size_t start = linia.find("#DISPLAYBPM:") + 12;
								size_t end = linia.length() - 1;

								if (linia.substr(start, (end - start) + 1) == ";")
								{
									continue;
								}

								chart.BPM = linia.substr(start, end - start);

								if (chart.BPM.find(":") != string::npos)
								{
									chart.BPM.replace(chart.BPM.find(":"), 1, " - ");
								}
							}

							if (linia.find("#DESCRIPTION:") == 0)
							{
								if (chart.title.empty())
								{
									chart.ID = currentID++;
									chart.title = BazaChartow.back().title;
									chart.subtitle = BazaChartow.back().subtitle;
									chart.artist = BazaChartow.back().artist;
									chart.length = BazaChartow.back().length;
									chart.BPM = BazaChartow.back().BPM;
									chart.pack = BazaChartow.back().pack;
								}

								size_t start = linia.find("#DESCRIPTION:") + 13;
								size_t end = linia.length() - 1;
								if (linia.substr(start, (end - start) + 1) != ";")
								{
									chart.technotation = linia.substr(start, end - start);
								}
								else
								{
									chart.technotation = " ";
								}

								if (chart.technotation.find("|") != string::npos)
								{
									chart.technotation.erase(chart.technotation.find("|"), 1);
								}
							}

							if (linia.find("#DIFFICULTY:") == 0)
							{
								size_t start = linia.find("#DIFFICULTY:") + 12;
								size_t end = linia.length() - 1;
								chart.difficulty = linia.substr(start, end - start);
							}

							if (linia.find("#METER:") == 0)
							{
								size_t start = linia.find("#METER:") + 7;
								size_t end = linia.length() - 1;
								chart.rating = stoi(linia.substr(start, end - start));
							}

							if (linia.find("#CREDIT:") == 0)
							{
								if (checkcredits == 0)
								{
									checkcredits++;
								}
								else
								{
									size_t start = linia.find("#CREDIT:") + 8;
									size_t end = linia.length() - 1;
									chart.charter = linia.substr(start, end - start);
								}

								if (chart.charter.find("|") != string::npos)
								{
									chart.charter.erase(chart.charter.find("|"), 1);
								}
							}

							if (linia.find("#NOTES:") == 0)
							{
								int NotesAmount = 0;
								int LongNotesAmount = 0;
								int RollsAmount = 0;
								int MinesAmount = 0;

								while (getline(plik, linia))
								{
									if (linia.find(";") != string::npos)
									{
										break;
									}

									for (char c : linia)
									{
										switch (c)
										{
										case '1': NotesAmount++; break;
										case '2': LongNotesAmount++; break;
										case '4': RollsAmount++; break;
										case 'M': MinesAmount++; break;
										case '0': break;
										case '3': break;
										default: break;
										}
									}
								}
								chart.Notes = NotesAmount;
								chart.LongNotes = LongNotesAmount;
								chart.Rolls = RollsAmount;
								chart.Mines = MinesAmount;

								BazaChartow.push_back(chart);
								chart = Chart();
							}
						}
						plik.close();

					}
				}
			}
		}
	}

	int option = 0;
	do
	{
		cout << "===STEPMANIA .SSC FILES EXTRACTION===" << endl;
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
		case 1: DisplayChartsData(BazaChartow); break;
		case 2:
			{
				SaveToChartsData(BazaChartow);
				SaveToNotesStats(BazaChartow);
				break;
			}
		case 3: cout << "closing program..." << endl; break;
		default: cout << "wrong option, try again" << endl; break;
		}
	} while (option != 3);
}