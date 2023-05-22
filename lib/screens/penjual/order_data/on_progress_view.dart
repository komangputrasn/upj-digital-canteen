import 'package:flutter/material.dart';

class OnProgressTab extends StatelessWidget {
  const OnProgressTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) => OnProgressCard(),
        separatorBuilder: (context, index) => SizedBox(height: 15),
      ),
    );
  }
}

class OnProgressCard extends StatelessWidget {
  const OnProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.7),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        height: 200,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nasi Goreng',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('User ID'),
                  SizedBox(
                    width: 140,
                    child: Text(
                      'MR7hrKikLjf5owlwADIGDFbtanH2',
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total'),
                  Text(
                    'Rp15000',
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Divider(
                thickness: 5,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Accept'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Decline'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
