package chat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Random;
import java.util.Scanner;
import java.util.Vector;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class Client {

	///////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////
	private class CleAES {

		private KeyGenerator cleGen; 
		private SecretKey cleSecrete;
		private IvParameterSpec initialVector;
		private String algo= "AES/CBC/PKCS5Padding";

		public void setKey(String cleSecrete) {
			byte[] decodedKey = Base64.getDecoder().decode(cleSecrete);
			SecretKey originalKey = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");
			this.cleSecrete = originalKey;
		}
		public void setIv(String vecteurInitial) {
			byte[] vector = new byte[16];
			int[] entier = new int[16];
			//decoupage du string
			vecteurInitial = vecteurInitial.substring(1, vecteurInitial.length()-1);
			String[] liste = vecteurInitial.split(", ");
			//passage String to int
			for (int i = 0; i < liste.length; i++) {
				entier[i] = Integer.parseInt(liste[i]);
			}
			//passage int to byte
			for (int i = 0; i < liste.length; i++) {
				vector[i] = ((Integer) entier[i]).byteValue();
			}
			
			this.initialVector = new IvParameterSpec(vector);
		}


		public void genererCle() {
			//construction de la clé
			try {cleGen = KeyGenerator.getInstance("AES");} catch (NoSuchAlgorithmException e) {System.out.println("L'AES existe pas"); e.printStackTrace();}
			SecureRandom alea = new SecureRandom();
			cleGen.init(256,alea);
			cleSecrete = cleGen.generateKey();

			//generation de l'initial vector
			byte[] initialVector = new byte[16];
			new SecureRandom().nextBytes(initialVector);
			this.initialVector = new IvParameterSpec(initialVector);


			String key = cleSecrete.getEncoded().toString();
			//System.out.println(key);
		}

		/*
		public IvParameterSpec generateIv() {
			byte[] initialVector = new byte[16];
			new SecureRandom().nextBytes(initialVector);
			return new IvParameterSpec(initialVector);

		}
		 */
		public String crypatage(String mes) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException{
			Cipher cipher = Cipher.getInstance(this.algo);
			cipher.init(Cipher.ENCRYPT_MODE, this.cleSecrete, this.initialVector);
			byte[] cipherText = cipher.doFinal(mes.getBytes());
			return Base64.getEncoder().encodeToString(cipherText);
		}


		public String decrypatage(String mesCode) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidAlgorithmParameterException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException{
			Cipher cipher = Cipher.getInstance(this.algo);
			cipher.init(Cipher.DECRYPT_MODE, this.cleSecrete, this.initialVector);
			byte[] mesDecrypte = cipher.doFinal(Base64.getDecoder().decode(mesCode));
			return new String(mesDecrypte);
		}


	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////
	private class PrimeNumberGen {
	    private long n;
	    public long getPrimeNumber(){
	        this.n = (int)(new Random().nextDouble()*100)+250;
	        long l = 0;
	        l = (long) ((this.n)*(Math.log(this.n) + (Math.log(Math.log(this.n)) -1) + ((Math.log(Math.log(this.n))-2)/(Math.log(this.n))) - ((Math.log(Math.log(this.n)) -21.0/10.0)/Math.log(this.n)) ));
	        for(long i=l;;i++){
	            if(isPrime(i)){
	                return i;
	            }
	        }
	    }
	    private boolean isPrime(long n){
	        if(n%2 == 0 || n%3 == 0) return false;
	        for(int i=5; i*i<=n; i+=6){
	            if(n%i == 0 || n%(i+2)==0) return false;
	        }
	        return true;
	    }
	}
	
	public class PrimitiveRootGen {
	    long pr, p, phi;
	    public PrimitiveRootGen(long p){
	        this.p = p;
	        this.phi = this.p - 1;
	        Vector<Long> primitiveRoots =  this.getPrimitiveRoot(this.p, this.phi);
	        this.pr = primitiveRoots.get(new Random().nextInt(primitiveRoots.size()));
	    }

	    public long getPr() {
	        return pr;
	    }

	    private Vector<Long> getPrimitiveRoot(long p, long phi){
	        Vector<Long> primeFactors = this.genPrimesFactorsList(phi);
	        Vector<Long> primitiveRoots = new Vector<>();
	        for(long i = 2;i<p;i++){
	            boolean flg = false;
	            for(Long l: primeFactors){
	                BigInteger iBig = BigInteger.valueOf(i);
	                BigInteger phiBig = BigInteger.valueOf(phi/l);
	                BigInteger pBig = BigInteger.valueOf(p);
	                BigInteger pRootBig = iBig.modPow(phiBig, pBig);
	                if(pRootBig.compareTo(BigInteger.valueOf(1))==0){
	                    flg = true;
	                    break;
	                }
	            }
	            if(!flg)primitiveRoots.add(i);
	        }
	        return primitiveRoots;
	    }

	    private Vector<Long> genPrimesFactorsList(long phi){
	        Vector<Long> primesFactors = new Vector<>();
	        while(phi % 2 == 0){
	            primesFactors.add((long) 2);
	            phi /= 2;
	        }
	        for(long i=3;i<=Math.sqrt(phi);i+=2){
	            if(phi % i == 0){
	                primesFactors.add(i);
	                phi /= i;
	            }
	        }
	        if(phi > 2){
	            primesFactors.add(phi);
	        }
	        return primesFactors;
	    }
	}
	
	private class DiffieHellMan{
		BigInteger p, g;
	    public DiffieHellMan(){
	    	genPrimeAndPrimitiveRoot();
	    }

	    public void genPrimeAndPrimitiveRoot(){
	        this.p = BigInteger.valueOf(new PrimeNumberGen().getPrimeNumber());
	        this.g = BigInteger.valueOf(new PrimitiveRootGen(this.p.intValue()).getPr());
	    }

	    public BigInteger getP() {
	        return p;
	    }

	    public BigInteger getG() {
	        return g;
	    }

	    public BigInteger getAliceMessage(BigInteger aliceSecretNumber){
	        return this.g.modPow(aliceSecretNumber, this.p);
	    }

	    public BigInteger getBobMessage(BigInteger bobSecretNumber){
	        return this.g.modPow(bobSecretNumber, this.p);
	    }

	    public BigInteger aliceCalculationOfKey (BigInteger bobMessage, BigInteger aliceSecretNumber){
	        return bobMessage.modPow(aliceSecretNumber, this.p);
	    }

	    public BigInteger bobCalculationOfKey(BigInteger aliceMessage, BigInteger bobSecretNumber){
	        return aliceMessage.modPow(bobSecretNumber, this.p);
	    }
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////
		
	CleAES aes = new CleAES();

	Boolean conditionArret(String message) {
		return message.toLowerCase().equals("bye");
	};
	
	//recuperation des cles AES et InitVector
	Boolean recupKey = true;
	Boolean recupInitVector = true;

	//variable pour femer la discussion
	Boolean baliseFin = true;
	
	//les Threads qui vont être utiliser
	Thread recevoir = null;
	Thread envoyer = null;
	Socket echoSocket = null;
	PrintWriter out  = null;
	BufferedReader in = null;
	
	//la lecture des messages qui vont être envoyé
	final Scanner scanner = new Scanner(System.in);

	
	public String[] retireBalise(String message) {
		int fin = 0;
		for (int i = 0; i < message.length(); i++) {
			if (message.charAt(i) == '>') {
				fin = i+1;
			}
		}
		String[] retour = new String[2];
		retour[0] = message.substring(0, fin);
		retour[1] = message.substring(fin);
		return retour;
	}

	//fermeture du client - fermeture de l'application
	public void Quit() {
		System.out.println("#############################\n"
				+ "La connexion est fermée, au revoir.");
		System.exit(0) ;
	}


	public Client(String lien,	int port) {

		try {
			//info serv
			//System.out.println("Recherche du serveur");
			echoSocket = new Socket(lien,port);

			//connexion
			//System.out.println("Lancement socket");
			out = new PrintWriter(echoSocket.getOutputStream());
			in = new BufferedReader(new InputStreamReader(echoSocket.getInputStream()));
			////////////////////////////////////////////////////////////
			////////////////////////////////////////////////////////////
			//discussion
			System.out.println(
					"#############################"
							+ "\n -- Initialisation du Chat --"
							+ "\n (quitter avec 'bye' )");
			//envoyer des messages
			envoyer = new Thread(new Runnable() {
				String message;
				@Override
				public void run() {
					while(baliseFin){
						message = scanner.nextLine();
						//##############################
						/*
						try {System.out.println(aes.crypatage(message));} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException
								| InvalidAlgorithmParameterException | BadPaddingException
								| IllegalBlockSizeException e1) {e1.printStackTrace();}						
						try {System.out.println(aes.decrypatage(aes.crypatage(message)));} catch (InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException
								| InvalidAlgorithmParameterException | BadPaddingException
								| IllegalBlockSizeException e1) {e1.printStackTrace();}
						*/
						
						try {out.println(aes.crypatage(message));} catch (Exception e) {e.printStackTrace();}
						out.flush();
						if (conditionArret(message)) {
							Quit();}
					}

				}
			});
			envoyer.start();

			recevoir = new Thread(new Runnable() {
				String message;
				@Override
				public void run() {

					//recuperation des informations pour le fonctionnement de la l'AES
					while (recupKey || recupInitVector) {
						try {
							String message = in.readLine();
							if (message.charAt(0) == 'k') {
								String cle = message.substring(1, message.length());
								
								//System.out.println(cle);
								aes.setKey(cle);
								recupKey = false;
							}

							if (message.charAt(0) == 'i') {
								String iv = message.substring(1, message.length());
								//System.out.println(iv);
								aes.setIv(iv);
								recupInitVector = false;
							}
						}catch (Exception e) {System.out.println(e);}
					}
					
					//discussion classique
					try {
						message = in.readLine();
						while(message!=null){
							String[] retour = null;
							try {retour = retireBalise(aes.decrypatage(message));} catch (Exception e) {e.printStackTrace();}
							System.out.println(retour[0]+retour[1]);
							if(conditionArret(message)) {
								Quit();
							}
							
							//pourquoi cette ligne
							message = in.readLine();
						}
						System.out.println("Serveur déconnecté");
						//recevoir.close();
						Quit();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			});
			recevoir.start();
			/*
	        envoyer.join();
	        recevoir.join();
			 */

		}
		catch(UnknownHostException e){
			System.out.println("« Destination unknown »") ;
			System.exit(-1) ;
		}
		catch(SocketException e) {
			System.out.println("Fermeture du serveur");
		}
		catch(IOException u){
			System.out.println("« Le serveur est actuellement fermé »") ;
			System.out.println(u);
			System.exit(-1) ;
		} 

	}

	//TODO 
	/*
	 * balise pour InitialVector
	 * balise pour SecretKey
	 * 
	 * Clé + IV unique pour chaque client
	 * Gestion message privé/public
	 * 
	 * gestion de la perte de serveur
	 * gestion de la fermeture de la connexion
	 * 
	 * fermeture de l'application
	 * 
	 * partie graphique
	 * 
	 * faire le compte-rendue
	 * 
	 */

	public static void main(String[] args) {
		//$ ip -br -c a (sur le pc serveur)
		Client client = new Client("192.168.23.194",55555);
	}
}


