package util

import grails.transaction.Transactional

@Transactional
class DataConversionService {

    def ArrayList convertToListOfMaps(String str) {
        if(str != null) {
            String[] t2 = str.split('","');
            String t3 = t2[0].substring(2, t2[0].length() - 1);
            String[] lpd = t3.split("}");

            def personDetailList = new ArrayList();

            for ( int i = 0 ; i < lpd.length ; i++ ) {
                String temp;

                if(i > 0) {
                    temp = lpd[i].substring(3, lpd[i].length());
                }
                else {
                    temp = lpd[i];
                }

                String[] tokens = temp.split(",");
                Map<String, String> m = new TreeMap<String, String>();
                for ( int j = 0 ; j < tokens.length ; j++ ) {

                    def key = tokens[j].split("=")[0]
                    def value = null

                    if(tokens[j].split("=").size() > 1) {
                        value = tokens[j].split("=")[1];
                    }

                    if(j > 0) {
                        m.put(key.substring(1, key.length()), value);
                    }
                    else {
                        m.put(key, value);
                    }
                }

                personDetailList.add(m);
            }

            return personDetailList
        }
        else {
            ArrayList a = new ArrayList();
            return a;
        }
    }
}
