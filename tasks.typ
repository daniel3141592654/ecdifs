#let todo = [#sym.ballot]
#let done = [#sym.ballot.cross]

#let task(head, bucketlist) = {

  let count = 0
  let finish_count = 0

  for x in bucketlist.children {

    if (x.func() == list.item or x.func() == enum.item) {

      if x.at("body").has("children"){

          if x.at("body").children.at(0) == [#sym.ballot.cross] {

            finish_count += 1
            count += 1
        }
          else if x.at("body").children.at(0) == [#sym.ballot] {

            count += 1

        }
      }
    }
  }

  let completion = {

    if finish_count < count{

      text(fill:red)[ \[#finish_count/#count\] ]

    } else {

      text(fill:green)[ \[#finish_count/#count\] ]

    }

  }

  // Showing the title and completion

  heading(

    level: head.at("depth"),
    [#head.at("body") #completion]

  )

  bucketlist

}
