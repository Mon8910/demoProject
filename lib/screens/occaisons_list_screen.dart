import 'package:demo_project/models/ocaisons_products.dart';
import 'package:demo_project/providers/product_occaisons.dart';
import 'package:demo_project/screens/occaisons_list_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OccaionsListScreen extends StatefulWidget {
  const OccaionsListScreen({super.key,  this.occasionTypeId});
  final int? occasionTypeId;

  @override
  State<OccaionsListScreen> createState() {
    return _OccaionsListScreenState();
  }
}

class _OccaionsListScreenState extends State<OccaionsListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductOccaisons>(context, listen: false)
      .getallData(widget.occasionTypeId!);
    });
  }

  //final occasionLists = Apiprovderdetails();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Birthday',
            style: GoogleFonts.jost(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(1, 26, 26, 26).withOpacity(1)),
            textAlign: TextAlign.center,
          ),
          actions: const [Icon(Icons.search)],
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_rounded,)),
          backgroundColor: Theme.of(
            context,
          ).colorScheme.onPrimary,
          elevation: 0.0,
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * .099,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(1, 26, 26, 26).withOpacity(1),
                    )),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: ListTile(
                  leading: Image.asset(
                    'assets/images/discount-shape.png',
                  ),
                  title: Text(
                    'Top offers for Birthday ',
                    style: GoogleFonts.jost(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    'Discover top offers for birthday’s gift and save money ',
                    style: GoogleFonts.jost(
                        fontWeight: FontWeight.w400, fontSize: 10),
                  ),
                  trailing:const Icon(Icons.keyboard_arrow_right,),
                ),
              ),
            ),
            Expanded(child: Selector<ProductOccaisons,List<Product>>(selector: (p0, p1) => p1.productdata,
              builder: (context, value, child) {
                return GridView.builder(
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .67,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 1
                        )
                        ,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OccaisonsListDetails(idproductdetails: value[index].id as int) ));
                          },

                         
                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start
                              
                              
                              ,children: [
                                Image.network(value[index].image.toString(),width: 168,height: 168,fit: BoxFit.cover,),
                               const SizedBox(
                                  height: 10,
                                ),
                                Text(value[index].name.toString(),style: GoogleFonts.jost(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:const Color.fromARGB(1, 26, 26, 26).withOpacity(1)

                          ),),
                         const SizedBox(height: 3,),
                          Row(
                            children: [
                            Text('\SAR ${value[index].price.toString()}',style: GoogleFonts.jost(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color:const Color.fromARGB(1, 26, 26, 26).withOpacity(1)
                            ),),
                           const SizedBox(width: 4,),
                             Text('\SAR ${value[index].priceAfterDiscount.toString()}',
                          style: GoogleFonts.jost(
                            decoration:  TextDecoration.lineThrough,
                            fontSize:12 ,
                            fontWeight: FontWeight.w500,
                            color:const Color.fromARGB(1, 197, 197, 197).withOpacity(1)
                          ))
                            ],
                          )

                                
                            
                            ],)
                        
                                             ,
                          ),
                        
                      );
                    });
              },
            ))
          ],
        ));
  }
}