import Flutter
import UIKit
import MessageUI
import MapKit

public class SwiftLinksaplicativosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "linksaplicativos", binaryMessenger: registrar.messenger())
    let instance = SwiftLinksaplicativosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult)
    {
        var map = call.arguments as? Dictionary<String, String>
        switch call.method
        {
        case "paginaWeb.abrir":
            var url = map?["url"]
            self.abrirPaginaWeb(url: url!)
        case "telefone.abrir":
            var numero = map?["numero"]
            self.abrirTelefone(numero: numero!)
        case "whatsapp.abrir":
            var whatsapp = map?["whatsapp"]
            var mensagem = map?["mensagem"]
            self.abrirWhatsapp(whatsapp: whatsapp!, mensagem: mensagem!)
        case "mapas.abrir":
            var latitude = map?["latitude"]
            var longitude = map?["longitude"]
            var nomeLocal = map?["nomeLocal"]
            self.abrirMapas(latitude: latitude!, longitude: longitude!, nomeLocal: nomeLocal!)
        case "email.abrir":
            var email = map?["email"]
            var titulo = map?["titulo"]
            var mensagem = map?["mensagem"]
            self.abrirEmail(email: email!, titulo: titulo!, mensagem: mensagem!)
        default:
            self.abrirPaginaWeb(url: "https://www.google.com.br")
        }
    }

    private func abrirPaginaWeb(url: String)
    {
       if let link = URL(string: url)
       {
            UIApplication.shared.openURL(link)
       }
    }

    private func abrirTelefone(numero: String)
    {
        if let urlPhone = URL(string: "tel://\(numero)")
        {
            if #available(iOS 10.0, *)
            {
                UIApplication.shared.open(urlPhone, options: [:], completionHandler: nil)
            }else
            {
                UIApplication.shared.canOpenURL(urlPhone)
            }
        }
    }

    private func abrirMapas(latitude: String, longitude: String, nomeLocal: String)
    {
       let googleMapsInstalled = UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!)

       if googleMapsInstalled
       {
           let alert = UIAlertController(title: "Traçar Rota", message: "Você deseja abrir com o Apple Maps ou Google Maps ?", preferredStyle: .alert)

           let appleMaps = UIAlertAction(title: "Apple Maps", style: .default, handler: {_ in

            let local = CLLocation(latitude: Double(latitude) as! CLLocationDegrees, longitude: Double(longitude) as! CLLocationDegrees)
               CLGeocoder().reverseGeocodeLocation(local) { (local, erro) in
                   if let dadosLocal = local?.first
                   {
                       let placeMark = MKPlacemark(placemark: dadosLocal)
                       let mapaItem = MKMapItem(placemark: placeMark)
                       mapaItem.name = nomeLocal
                       let opcoes = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                       mapaItem.openInMaps(launchOptions: opcoes)
                   }
               }
           })

           let googleMaps = UIAlertAction(title: "Gooogle Maps", style: .default, handler: {_ in

               var lat = String(latitude)
               var lng = String(longitude)

               let url = URL(string: "comgooglemaps://?saddr=&daddr=\(lat),\(lng)&directionsmode=driving")
               if #available(iOS 10.0, *)
               {
                   UIApplication.shared.open(url as! URL, options: [:], completionHandler: nil)
               }else
               {
                   //UIApplication.canOpenURL(url)
               }
           })

           let cancelar = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)

           alert.addAction(appleMaps)
           alert.addAction(googleMaps)
           alert.addAction(cancelar)

        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true)
       }else
       {
        let local = CLLocation(latitude: Double(latitude) as! CLLocationDegrees, longitude: Double(longitude) as! CLLocationDegrees)
           CLGeocoder().reverseGeocodeLocation(local) { (local, erro) in
               if let dadosLocal = local?.first
               {
                   let placeMark = MKPlacemark(placemark: dadosLocal)
                   let mapaItem = MKMapItem(placemark: placeMark)
                   mapaItem.name = nomeLocal
                   let opcoes = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                   mapaItem.openInMaps(launchOptions: opcoes)
               }
           }
       }
    }

    private func abrirWhatsapp(whatsapp: String, mensagem: String)
    {
        let url = "whatsapp://send?phone=+55\(whatsapp)&abid=12354&text=\(mensagem)"
        if let urlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        {
            if let whatsappUrl = URL(string: urlString)
            {
                if UIApplication.shared.canOpenURL(whatsappUrl)
                {
                    if #available(iOS 10.0, *)
                    {
                        UIApplication.shared.open(whatsappUrl, options: [:], completionHandler: nil)
                    }else
                    {
                        UIApplication.shared.canOpenURL(whatsappUrl)
                    }
                }
            }
        }
    }

    private func abrirEmail(email: String, titulo: String, mensagem: String)
    {
        guard MFMailComposeViewController.canSendMail() else {
                   //Show alert informing the user
                   return
               }

               let composer = MFMailComposeViewController()
               composer.mailComposeDelegate = self
               composer.setToRecipients([email])
               composer.setSubject(titulo)
               composer.setMessageBody(mensagem, isHTML: false)

            UIApplication.shared.keyWindow?.rootViewController?.present(composer, animated: true)
    }
}

extension SwiftLinksaplicativosPlugin: MFMailComposeViewControllerDelegate {

    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {

        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            return
        }

        switch result {
        case .cancelled:
            print("Cancelado")
        case .failed:
            print("Error")
        case .saved:
            print("Salvo")
        case .sent:
            print("Email enviado")
        @unknown default:
            break
        }

        controller.dismiss(animated: true)
    }
}


