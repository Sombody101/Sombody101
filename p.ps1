function get_stream {
   $request = [System.Net.HttpWebRequest]::Create("http://parrot.live");
   $response = $request.GetResponse();
   $receiveStream = $response.GetResponseStream();
   return [System.IO.StreamReader]::new($receiveStream);
}
 
 $readStream = get_stream
 [console]::TreatControlCAsInput = $true;

while ($true){
 $initialForegroundColor = [Console]::ForegroundColor;
 try {
   while ($line = $readStream.ReadLine()) {
     [Console]::WriteLine($line);
   }
 }
 catch 
 {
   $readStream = get_stream
 }
}
