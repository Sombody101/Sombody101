 $request = [System.Net.HttpWebRequest]::Create("http://parrot.live");
 $response = $request.GetResponse();
 $receiveStream = $response.GetResponseStream();
 $readStream = [System.IO.StreamReader]::new($receiveStream);

 [console]::TreatControlCAsInput = $true;

while ($true){
 $initialForegroundColor = [Console]::ForegroundColor;
 while ($line = $readStream.ReadLine()) {
   [Console]::WriteLine($line);
 }
}

 $readStream.Close();
 $receiveStream.Close();
 $request.Abort();
 [console]::TreatControlCAsInput = $false;
 [Console]::ForegroundColor = $initialForegroundColor;
