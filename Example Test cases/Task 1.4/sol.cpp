#include <bits/stdc++.h>

using namespace std;



int main(){

	ios::sync_with_stdio(0);
	cin.tie(0);

	int t;
	cin >> t;

	while(t--){
	int m;
	cin>>m;
	vector<int>h;
	for(int i = 0 ; i<m;i++){
		int x;
		cin>>x;
		h.push_back(x);	
	}
	vector<int> ans;
        stack<int> s;
        int c=1;
        int n=h.size();
        for(int i=n-1;i>=0;i--){
            if(s.size()==0){
                ans.push_back(0);
            }
            else if(s.size()>0 and s.top()>=h[i]){
                ans.push_back(1);
            }
            else if(s.size()>0 and s.top()<h[i]){
                c=0;
                while(s.size()>0 and s.top()<h[i] ){
                    c++;
                    s.pop();
                }
                if(s.size()==0){
                    ans.push_back(c);
                }
                else{
                    ans.push_back(c+1);
                }
            }
            s.push(h[i]);
        }
        reverse(ans.begin(),ans.end());
        for(auto vv: ans)
		cout<<vv<<" ";
	
	cout<<"\n";
	}

	return 0;
}


