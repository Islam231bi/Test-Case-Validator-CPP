#include <bits/stdc++.h>

using namespace std;



int main(){

	ios::sync_with_stdio(0);
	cin.tie(0);

	int t;
	cin >> t;

	while(t--){
	    string s;
	    cin >>s;
	    string res = "";
            int i=0;
            while(i < s.size())
            {
            	if (i + 2 < s.size() && s[i + 2] == '#')
            	{
                	int num = stoi(s.substr(i,2));
                	res.push_back(char(97 + num - 1));   
                	i += 3;
            	}
            	else
            	{
                	int num = stoi(s.substr(i,1));
                	res.push_back(char(97 + num - 1));   
                	i += 1;
            	}
            }	
		
	   cout <<res<<"\n";
	}

	return 0;
}


