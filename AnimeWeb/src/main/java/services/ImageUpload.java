package services;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.Part;

import net.coobird.thumbnailator.Thumbnails;
import org.jdbi.v3.core.Jdbi;

import database.JDBiConnector;

public class ImageUpload {
	public static final String SAVE_PATH = "anime-main" + File.separator + "storage" + File.separator + "avatarUser" + File.separator;
	public static final String SAVE_FOLDER = "/anime-main/" + "/storage"  + "/avatarUser/";
	public ImageUpload() {

	}
	public String findImageUser(int idUser,int typeID) {
		Jdbi me = JDBiConnector.me();
		String query="select avatar from animeweb.accounts where id=:idUser and typeId=:typeId";
		return me.withHandle(handle->{
			return handle.createQuery(query).bind("idUser", idUser).bind("typeId", typeID).mapTo(String.class).findOne().orElse("/anime-main/storage/avatarUser/defaultavatar.jpg");
		});
	}
	public String getExtensionFile(String fileName) {
		int index = fileName.lastIndexOf('.');
		return fileName.substring(index);
	}
	public String createSavePathAvatarUser(String realPath,int idUser,String moreExtension,String extension) {
		return realPath + SAVE_PATH + idUser+moreExtension + extension;
	}
	public String createSaveAvatarUserData(int idUser,String moreExtension,String extension) {
		return SAVE_FOLDER + idUser+moreExtension + extension;
	}
	public boolean saveAvatarUser(Part file, int idUser, String realPath,String moreExtension) throws IOException {
		Path tempPath = Paths.get(System.getProperty("java.io.tmpdir"),
				file.getSubmittedFileName());
		try (InputStream inputStream = file.getInputStream()) {
			Files.copy(inputStream, tempPath);
		}
		Path outputPath = Paths.get("output.jpg");

		String extension = getExtensionFile(file.getSubmittedFileName());
		String fullPath = createSavePathAvatarUser(realPath, idUser, moreExtension, extension);
//		file.write(fullPath);
		Thumbnails.of(tempPath.toFile())
				.size(50, 50)
				.outputQuality(1)
				.toFile(fullPath);
		Files.delete(tempPath);
		File f = new File(fullPath);
		return f.exists() && f.length() == file.getSize();

	}

}
