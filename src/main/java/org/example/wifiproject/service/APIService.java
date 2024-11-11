package org.example.wifiproject.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class APIService {
    public static int getTotal() throws ParseException {
        URL url = null;
        HttpURLConnection con= null;
        JSONObject result = null;
        StringBuilder sb = new StringBuilder();
        String getUrl = "http://openapi.seoul.go.kr:8088/486948787a666f633531454854726c/" +
                "json/TbPublicWifiInfo/1/1/";

        try {
            url = new URL(getUrl);
            con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Content-type", "application/json");
            con.setDoOutput(true);

            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            while(br.ready()) {
                sb.append(br.readLine());
            }
            con.disconnect();
        }catch(Exception e) {
            e.printStackTrace();
        }

        result = (JSONObject) new JSONParser().parse(sb.toString());

        JSONObject data = (JSONObject) result.get("TbPublicWifiInfo");
        int getTotal = Integer.parseInt( data.get("list_total_count").toString());

        System.out.println("sadf" + getTotal);

        return getTotal;
    }

    public int getWifi() throws ParseException{
        int start = 0;
        int end = 0;
        int total = 0;

        int getTotal = getTotal();
        int endPage = getTotal / 1000;
        int remain = getTotal % 1000;

        for (int i = 0; i <= endPage; i++) {
            start = (int) Math.pow(10, 3) * i + 1;
            if(i == endPage){
                end = start + remain - 1;
            }
            else{
                end = (int) Math.pow(10, 3) * (i+1) ;
            }
            String getUrl = "http://openapi.seoul.go.kr:8088/486948787a666f633531454854726c/" +
                    "json/TbPublicWifiInfo/";
            getUrl = getUrl + start + "/" + end + "/";

            URL url = null;
            HttpURLConnection con= null;
            JSONObject result = null;
            StringBuilder sb = new StringBuilder();

            try {
                url = new URL(getUrl);
                con = (HttpURLConnection) url.openConnection();
                con.setRequestMethod("GET");
                con.setRequestProperty("Content-type", "application/json");
                con.setDoOutput(true);

                BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
                while(br.ready()) {
                    String s = br.readLine();
                    sb.append(s);
                }
                con.disconnect();
            }catch(Exception e) {
                e.printStackTrace();
            }

            result = (JSONObject) new JSONParser().parse(sb.toString());
            JSONObject data = (JSONObject) result.get("TbPublicWifiInfo");
            JSONArray arr = (JSONArray) data.get("row");
            total += WifiService.addWifi(arr);
        }
        return total;
    }

    public static void main(String[] args) throws ParseException {
        WifiService wifiService = new WifiService();
        //List<WifiDto> wifiList = wifiService.getNearestWifiList("37.5682", "126.9977");
//        for (WifiDto wifiDto : wifiList) {
//            System.out.println("wifiDto = " + wifiDto);
//        }
    }
}
