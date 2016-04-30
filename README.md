#Simple Chain

This is an extremely simple blockchain implementation. It is an explanation as code. There is no p2p network, no currency, no key signing or transactions, etc.

##Block Protocol

Each block requires the bare minimum to create a blockchain. The "difficulty" is static. The only frill is a message that is added to each block.
<pre>
┌───────────────────────────┐      ┌───────────────────────────┐
│        Block Hash         │◀──┐  │        Block Hash         │
└───────────────────────────┘   │  └───────────────────────────┘
┌───────────────────────────┐   │  ┌───────────────────────────┐
│┌─────────────────────────┐│   │  │┌─────────────────────────┐│
││  (0x00) Previous Block  ││   └──┼┤     Previous Block      ││
│└─────────────────────────┘│      │└─────────────────────────┘│
│┌─────────────────────────┐│      │┌─────────────────────────┐│
││     nonce = rand()      ││      ││     nonce = rand()      ││
│└─────────────────────────┘│      │└─────────────────────────┘│
│┌─────────────────────────┐│      │┌─────────────────────────┐│
││Hey! I'm the first       ││      ││Woah! Another message!   ││
││message in the           ││      ││                         ││
││blockchain!              ││      ││                         ││
││                         ││      ││                         ││
││                         ││      ││                         ││
││                         ││      ││                         ││
││                         ││      ││                         ││
││                         ││      ││                         ││
│└─────────────────────────┘│      │└─────────────────────────┘│
└───────────────────────────┘      └───────────────────────────┘
</pre>
##Usage
Create a blockchain with `buildchain.rb` on the console. Then validate it with `validatechain.rb`. Neither script takes arguments. 

##Requirements
`gem install colorize`
