%Perform a t-test for each time point of each EAE mouse, comparing to the
%distribution given by the set of control mice

for n=1:9
    for m=1:8
        day=eae_day(1,n+3,m)
        
        if (isnan(day))
            p(1,n,m)=NaN
        else
            [h,p(1,n,m)]=ttest2(eae_zscore_raw(:,n,m),[cfa_zscore_raw_interpolated(:,day,1); cfa_zscore_raw_interpolated(:,day,2); cfa_zscore_raw_interpolated(:,day,3); cfa_zscore_raw_interpolated(:,day,4); cfa_zscore_raw_interpolated(:,day,5)])
        end
    end
end