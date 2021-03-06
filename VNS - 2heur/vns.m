function routes=vns(A, capacity)

    defaultStream = RandStream('mrg32k3a');
    RandStream.setDefaultStream(defaultStream);
    
    B=disttab(A);
    routes=PFIH(A,B,capacity);
    notImp=3;
    prcost=0
    while notImp<=5
        k=1;
        while k<=2
            if k==1
                [routes1 impr]=randTwoInterchange(routes, A, B, capacity, 1);
            end
            if k==2
                [routes1 impr]=randCrossExchange(A, B, routes, capacity, 1);
            end
            [routes2 impr cost]=innerVns(routes1, A, B, capacity);
            if round(prcost)==round(cost)
                impr=0;
            else
                prcost=cost;
            end
            if impr==1
                routes=routes2;
                k=1;
            else
                k=k+1;
            end
            k
        end
        if impr==0
            notImp=notImp+1
        end
    end
    