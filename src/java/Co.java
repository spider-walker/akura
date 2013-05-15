
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.file.FileVisitResult;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.Iterator;
import org.apache.commons.io.FileUtils;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author kandie
 */
public class Co {

    public static void transform(File source, String srcEncoding, File target, String tgtEncoding) throws IOException {
        BufferedReader br = null;
        BufferedWriter bw = null;
        try {
            br = new BufferedReader(new InputStreamReader(new FileInputStream(source), srcEncoding));
            bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(target), tgtEncoding));
            char[] buffer = new char[16384];
            int read;
            while ((read = br.read(buffer)) != -1) {
                bw.write(buffer, 0, read);
            }
            target.renameTo(source);
            
        } finally {
            try {
                if (br != null) {
                    br.close();
                }
            } finally {
                if (bw != null) {
                    bw.close();
                }
            }
        }
    }

    public static void main(String[] args) {
        Path p = Paths.get("H:/akura/src/java/com/virtusa/akura/api/dao");
        FileVisitor<Path> fv = new SimpleFileVisitor<Path>() {
            @Override
            public FileVisitResult visitFile(Path file, BasicFileAttributes attrs)
                    throws IOException {
                System.out.println(file);
                File f=new File(file.toString());
                
                transform(new File(file.toString()), "ISO-8859-7", new File(file.toString()+"_"), "UTF-8");
                return FileVisitResult.CONTINUE;
            }
        };

        try {
            Files.walkFileTree(p, fv);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
