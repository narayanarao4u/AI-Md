S e t   f s o   =   C r e a t e O b j e c t ( " S c r i p t i n g . F i l e S y s t e m O b j e c t " )    
  
 s H t m l   =   " < d i v   c l a s s = ' m a i n ' > < d i v   c l a s s = ' h e a d ' > < p > B S N L   V i s a k h a p a t n a m   ,   B A < / p > < p > D e s k t o p   P C / L a p t o p   D e t a i l s   C a p t u r e < / p > < / d i v > < t a b l e > < t r > < t d   c o l s p a n = ' 2 ' > < / t d > < / t r > < t r > < t d > < l a b e l > E n t e r   H R M S   N o   : < / l a b e l > < / t d > < t d > < i n p u t   i d = ' h r m s n o '   t y p e = ' t e x t ' > < / t d > < / t r > < t r > < t d > < l a b e l > E n t e r   N a m e   : < / l a b e l > < / t d > < t d > < i n p u t   i d = ' e m p n a m e '   t y p e = ' t e x t ' > < / t d > < / t r > < t r > < t d > < l a b e l > E n t e r   M o b i l e   N o   : < / l a b e l > < / t d > < t d > < i n p u t   i d = ' p h o n e '   t y p e = ' t e x t ' > < / t d > < / t r > < t r > < t d > < l a b e l > E x a c t   L o c a t i o n   O f   P C   o r   L a p t o p   : < / l a b e l > < / t d > < t d > < i n p u t   i d = ' l o c a t i o n t x t '   t y p e = ' t e x t ' > < / t d > < / t r > < t r > < t d > < / t d > < t d > E x a m p l e   :   S D E ( E B ) ,   G M   O f f i c e ,   1 s t   F l o o r < / t d > < / t r > < t r > < t d > < t d > < / t d > < / t r > < / t a b l e > < h r > < p > < b > I f   P r i n t e r   A v a i a b l e   ( P l e a s e   F i l l   P r i n t e r   D e t a i l s ) < / b > < / p > < t a b l e   s t y l e = ' w i d t h :   5 0 0 p x ' > < t r >   < t d > P r i n t e r   M a k e < / t d > < t d > P r i n t e r   M o d e l < / t d > < t d > P r i n t e r   S e r i a l   N o < / t d > < / t r > < t r >   < t d > < i n p u t   i d = ' p r n M a k e '   > < / t d > < t d > < i n p u t   i d = ' p r n M o d e l '   > < / t d > < t d > < i n p u t   i d = ' p r n S e r i a l N o '   s t y l e = ' w i d t h :   2 0 0 p x '   > < / t d > < / t r > < t r > < t d   c o l s p a n = ' 3 ' > < i n p u t   t y p e = ' b u t t o n '   v a l u e = ' S e n d '   s t y l e = ' f o n t - s i z e :   2 4 p x ;   f o n t - w e i g h t :   b o l d ; '     o n c l i c k = ' S e n d ( ) ' > < / t d > < / t r > < / t a b l e > < h r > < d i v   c l a s s = ' f o o t e r ' > @   B S N L   I T   T e a m ,   V i s a k h a p a t n a m     B A < / d i v > < / d i v > "  
  
     S e t   o R e t   =   O p e n D i a l o g ( s H t m l ,   " h r m s n o , e m p n a m e , p h o n e , l o c a t i o n t x t , p r n M a k e , p r n M o d e l , p r n S e r i a l N o " ,   7 0 0 ,   5 0 0 ,   " V i s a k h a p a t n a m   B A ,   I T   S e c t i o n " )  
   '   M s g B o x   " e m p n a m e   1 :   "   &   o R e t ( " e m p n a m e " )   &   " ,   h r m s n o   2 :   "   &   o R e t ( " h r m s n o " )   &   " , P h o n e :   "   &   o R e t ( " p h o n e " )   &   " , l o c a t i o n t x t :   "   &   o R e t ( " l o c a t i o n t x t " )  
 ' = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
  
 e m p n a m e   =     o R e t ( " e m p n a m e " )    
 h r m s n o   =     o R e t ( " h r m s n o " )    
 p h o n e   =     o R e t ( " p h o n e " )    
 l o c a t i o n t x t   =     o R e t ( " l o c a t i o n t x t " )    
 p r n M a k e   =     o R e t ( " p r n M a k e " )    
 p r n M o d e l   =     o R e t ( " p r n M o d e l " )    
 p r n S e r i a l N o   =     o R e t ( " p r n S e r i a l N o " )    
  
  
  
 i f   l e n ( p h o n e )   < >   1 0     t h e n  
     W S c r i p t . e c h o   " i n v a l i d   P h o n e   N u m b e r "  
     W S c r i p t . e c h o   " P l e a s e   r u n   t h e   a p p l i c a t i o n   a g a i n   a n d   F i l l   C o m p l e t e d   a n d   V a l i d   d a t a "  
     W s c r i p t . Q u i t  
 E n d   i f  
  
 i f   l e n ( h r m s n o )   <   8   o r   l e n ( h r m s n o )   >   9     t h e n  
     W S c r i p t . e c h o   " i n v a l i d   H R M S   N u m b e r "  
     W S c r i p t . e c h o   " P l e a s e   r u n   t h e   a p p l i c a t i o n   a g a i n   a n d   F i l l   C o m p l e t e d   a n d   V a l i d   d a t a "  
     W s c r i p t . Q u i t  
 E n d   i f  
  
  
 i f   l e n ( p h o n e )   < >   1 0   t h e n  
     W S c r i p t . e c h o   " i n v a l i d   P h o n e   N u m b e r "  
     W S c r i p t . e c h o   " P l e a s e   r u n   t h e   a p p l i c a t i o n   a g a i n   a n d   F i l l   C o m p l e t e d   a n d   V a l i d   d a t a "  
     W s c r i p t . Q u i t  
 E n d   i f  
  
  
 o u t p u t J S O N   =   " {   "  
 o u t p u t J S O N   =   o u t p u t J S O N   &     " ' e m p n a m e '   :     ' "   &     e m p n a m e   &   " ' ,   "  
 o u t p u t J S O N   =   o u t p u t J S O N   &     " ' h r m s n o '   :     ' "   &     h r m s n o   &   " ' ,   "  
 o u t p u t J S O N   =   o u t p u t J S O N   &     " ' p h o n e '   :     ' "   &     p h o n e   &   " ' ,   "  
 o u t p u t J S O N   =   o u t p u t J S O N   &     " ' l o c a t i o n t x t '   :     ' "   &     l o c a t i o n t x t   &   " ' ,   "  
 o u t p u t J S O N   =   o u t p u t J S O N   &     " ' p r n M a k e '   :     ' "   &     p r n M a k e   &   " ' ,   "  
 o u t p u t J S O N   =   o u t p u t J S O N   &     " ' p r n M o d e l '   :     ' "   &     p r n M o d e l   &   " ' ,   "  
 o u t p u t J S O N   =   o u t p u t J S O N   &     " ' p r n S e r i a l N o '   :     ' "   &     p r n S e r i a l N o   &   " ' ,   "  
 ' = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
  
 ' = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 F u n c t i o n   O p e n D i a l o g ( s H t m l ,   s F i e l d s , i W i d t h , i H e i g h t ,   s T i t l e )  
     s H t a F i l e P a t h   =   W s c r i p t . S c r i p t F u l l N a m e   &   " . h t a "  
      
     C r e a t e H t a F i l e   s H t a F i l e P a t h ,   s H t m l ,   s F i e l d s , i W i d t h , i H e i g h t , s T i t l e  
  
     S e t   f   =   f s o . G e t F i l e ( s H t a F i l e P a t h )  
     f . a t t r i b u t e s   =   f . a t t r i b u t e s   +   2   ' H i d d e n  
  
     D i m   o S h e l l :   S e t   o S h e l l   =   C r e a t e O b j e c t ( " W S c r i p t . S h e l l " )  
  
     o S h e l l . R u n   " " " "   &   s H t a F i l e P a t h   &   " " " " ,   1 ,   T r u e  
  
     I f   f s o . F i l e E x i s t s ( s H t a F i l e P a t h )   T h e n  
         f s o . D e l e t e F i l e   s H t a F i l e P a t h  
     E n d   I f  
  
     S e t   o R e t   =   C r e a t e O b j e c t ( " S c r i p t i n g . D i c t i o n a r y " )  
  
     ' L o a d   r e t u r n   d a t a   f r o m   X M L   F i l e  
     I f   f s o . F i l e E x i s t s ( s H t a F i l e P a t h   &   " . x m l " )   T h e n  
             S e t   o X m l   =   C r e a t e O b j e c t ( " M i c r o s o f t . X M L D O M " )  
             o X M L . a s y n c   =   F a l s e  
             o X M L . l o a d   s H t a F i l e P a t h   &   " . x m l "  
  
             F o r   e a c h   s F i e l d   I n   S p l i t ( s F i e l d s , " , " )  
                 o R e t . A d d   t r i m ( s F i e l d ) ,   o X M L . S e l e c t S i n g l e N o d e ( " / r o o t / "   &   t r i m ( s F i e l d ) ) . t e x t  
             N e x t  
  
             f s o . D e l e t e F i l e   s H t a F i l e P a t h   &   " . x m l "  
     E n d   I f  
  
     S e t   O p e n D i a l o g   =   o R e t  
 E n d   F u n c t i o n  
 ' = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
  
 S u b   C r e a t e H t a F i l e ( s H t a F i l e P a t h ,   s H t m l ,   s F i e l d s ,   i W i d t h ,   i H e i g h t ,   s T i t l e )  
     S e t   f   =   f s o . C r e a t e T e x t F i l e ( s H t a F i l e P a t h ,   T r u e )  
     f . W r i t e L i n e   " < h t m l > < t i t l e > B S N L   V i s k h a p a t n a m ,   I T   S e c t i o n < / t i t l e > < h e a d > < H T A : A P P L I C A T I O N   I D = o H T A   S I N G L E I N S T A N C E = " " y e s " "   S C R O L L = " " n o " " / > < / h e a d >   < s t y l e > "  
     f . W r i t e L i n e   " b o d y   {   b a c k g r o u n d - c o l o r :   r g b ( 1 6 2 ,   2 0 3 ,   2 4 4 ) ;   }   . m a i n   {   m a r g i n :   a u t o ;   w i d t h :   6 0 0 p x ;   p a d d i n g :   2 0 p x ;   }   . h e a d {   m a r g i n :   a u t o ;   p a d d i n g :   0 ;   t e x t - a l i g n :   c e n t e r ;   }   . h e a d   p {   p a d d i n g :   0 ;   m a r g i n :   0 ;   f o n t - s i z e :   1 . 2 5 r e m ;   f o n t - w e i g h t :   b o l d e r ;   }   t a b l e   {   b o r d e r :   3 p x   s o l i d   g r e e n ;   p a d d i n g :   2 0 p x ;   }   i n p u t   {   w i d t h :   1 0 0 % ;   b o r d e r :   n o n e ;   }   . f o o t e r   {   m a r g i n :   a u t o ;   t e x t - a l i g n :   c e n t e r ;   b a c k g r o u n d - c o l o r :   r g b ( 0 ,   0 ,   0 ) ;   c o l o r :   r g b ( 2 5 5 ,   2 5 5 ,   2 5 5 ) ;   w i d t h :   4 5 % ;   } "  
     f . W r i t e L i n e   " < / s t y l e > < / h e a d > "  
     f . W r i t e L i n e   " < s c r i p t   l a n g u a g e = " " v b s c r i p t " " > "  
     f . W r i t e L i n e   " W i n d o w . R e s i z e T o   "   &   i W i d t h   &   " ,   "   &   i H e i g h t  
     f . W r i t e L i n e   " S e t   f s o   =   C r e a t e O b j e c t ( " " S c r i p t i n g . F i l e S y s t e m O b j e c t " " ) "  
     f . W r i t e L i n e   " "  
     f . W r i t e L i n e   " S u b   S e n d ( ) "  
     f . W r i t e L i n e   "   D i m   s F i l e P a t h :   s F i l e P a t h   =   R e p l a c e ( l o c a t i o n . h r e f , " " f i l e : / / / " " , " " " " ) "  
     f . W r i t e L i n e   "   s F i l e P a t h   =   R e p l a c e ( s F i l e P a t h , " " / " " , " " \ " " ) "  
     f . W r i t e L i n e   "   s F i l e P a t h   =   R e p l a c e ( s F i l e P a t h , " " % 2 0 " " , " "   " " ) "  
     f . W r i t e L i n e   "   S e t   o X m l   =   C r e a t e O b j e c t ( " " M i c r o s o f t . X M L D O M " " ) "  
     f . W r i t e L i n e   "   S e t   o R o o t   =   o X m l . c r e a t e E l e m e n t ( " " r o o t " " ) "  
     f . W r i t e L i n e   "   o X m l . a p p e n d C h i l d   o R o o t "  
  
     F o r   e a c h   s F i e l d   I n   S p l i t ( s F i e l d s , " , " )  
         f . W r i t e L i n e   "   A d d X m l V a l   o X m l ,   o R o o t ,   " " "   &   s F i e l d   &   " " " ,   G e t V a l ( "   &   s F i e l d   &   " ) "  
     N e x t  
  
     f . W r i t e L i n e   "   o X m l . S a v e   s F i l e P a t h   &   " " . x m l " " "  
     f . W r i t e L i n e   "   s e l f . C l o s e ( ) "  
     f . W r i t e L i n e   " E n d   S u b "  
     f . W r i t e L i n e   " "  
     f . W r i t e L i n e   " S u b   A d d X m l V a l ( o X m l ,   o R o o t ,   s N a m e ,   s V a l ) "  
     f . W r i t e L i n e   "   S e t   o N o d e   =   o X m l . c r e a t e E l e m e n t ( s N a m e ) "  
     f . W r i t e L i n e   "   o N o d e . T e x t   =   s V a l "  
     f . W r i t e L i n e   "   o R o o t . a p p e n d C h i l d   o N o d e "  
     f . W r i t e L i n e   " E n d   S u b "  
     f . W r i t e L i n e   " "  
     f . W r i t e L i n e   " F u n c t i o n   G e t V a l ( o ) "  
     f . W r i t e L i n e   "   G e t V a l   =   o . v a l u e "  
     f . W r i t e L i n e   "   I f   o . T y p e   =   " " c h e c k b o x " "   T h e n "  
     f . W r i t e L i n e   "       I f   o . c h e c k e d   =   F a l s e   T h e n "  
     f . W r i t e L i n e   "           G e t V a l   =   " " " " "  
     f . W r i t e L i n e   "       E n d   I f "  
     f . W r i t e L i n e   "   E n d   I f "  
     f . W r i t e L i n e   " E n d   F u n c t i o n "      
     f . W r i t e L i n e   " < / s c r i p t > "  
     f . W r i t e L i n e   " < b o d y > "  
     f . W r i t e L i n e   s H t m l  
     f . W r i t e L i n e   " < / b o d y > < / h t m l > "  
     f . C l o s e  
 E n d   S u b  
  
 F u n c t i o n   P C i n f o ( o u t p u t J S O N )  
                                                    
     S e t   o b j S h e l l   =   C r e a t e O b j e c t ( " W S c r i p t . S h e l l " )  
     S e t   o b j W M I S e r v i c e   =   G e t O b j e c t ( " w i n m g m t s : \ \ . \ r o o t \ c i m v 2 " )  
      
      
     '   G e t   M A C   A d d r e s s  
     S e t   c o l I t e m s   =   o b j W M I S e r v i c e . E x e c Q u e r y ( " S e l e c t   *   F r o m   W i n 3 2 _ N e t w o r k A d a p t e r C o n f i g u r a t i o n   W h e r e   I P E n a b l e d   =   T r u e " )  
     F o r   E a c h   o b j I t e m   i n   c o l I t e m s  
         M A C A d d r e s s   =   R e p l a c e ( o b j I t e m . M A C A d d r e s s ,   " : " ,   " - " )  
         o u t p u t J S O N   =   o u t p u t J S O N   &     " ' M A C A d d r e s s '   :     ' "   &   M A C A d d r e s s   &   " ' ,   "  
     N e x t  
      
     '   G e t   I P   A d d r e s s  
     S e t   c o l I t e m s   =   o b j W M I S e r v i c e . E x e c Q u e r y ( " S e l e c t   *   f r o m   W i n 3 2 _ N e t w o r k A d a p t e r C o n f i g u r a t i o n   W h e r e   I P E n a b l e d   =   T r u e " )  
      
     F o r   E a c h   o b j I t e m   i n   c o l I t e m s  
         I f   N o t   I s N u l l ( o b j I t e m . I P A d d r e s s )   T h e n  
                 F o r   i = L B o u n d ( o b j I t e m . I P A d d r e s s )   T o   U B o u n d ( o b j I t e m . I P A d d r e s s )  
                         I f   I n S t r ( o b j I t e m . I P A d d r e s s ( i ) ,   " . " )   >   0   T h e n  
                                 o u t p u t J S O N   =   o u t p u t J S O N   &     " ' I P v 4 A d d r e s s '   :     ' "   &   o b j I t e m . I P A d d r e s s ( i )   &   " ' ,   "  
                                 E x i t   F o r  
                         E n d   I f  
                 N e x t  
         E n d   I f  
     N e x t  
      
      
     '   G e t   H o s t n a m e  
     s t r C o m p u t e r N a m e   =   o b j S h e l l . E x p a n d E n v i r o n m e n t S t r i n g s ( " % C O M P U T E R N A M E % " )  
     o u t p u t J S O N   =   o u t p u t J S O N   &     " ' H o s t n a m e '   :     ' "   &   s t r C o m p u t e r N a m e   &   " ' ,   "  
      
      
     '   G e t   s y s t e m   i n f o r m a t i o n  
     S e t   c o l I t e m s   =   o b j W M I S e r v i c e . E x e c Q u e r y ( " S e l e c t   *   F r o m   W i n 3 2 _ C o m p u t e r S y s t e m " )  
     F o r   E a c h   o b j I t e m   i n   c o l I t e m s  
         o u t p u t J S O N   =   o u t p u t J S O N   &     " ' S y s t e m N a m e '   :   ' "   &   o b j I t e m . N a m e   &   " ' ,   "  
         o u t p u t J S O N   =   o u t p u t J S O N   &     " ' S y s t e m M a n u f a c t u r e r '   :   ' "   &   o b j I t e m . M a n u f a c t u r e r   &   " ' ,   "  
         o u t p u t J S O N   =   o u t p u t J S O N   &     " ' S y s t e m M o d e l '   :   ' "   &   o b j I t e m . M o d e l   &   " ' ,   "  
         U s e r N a m e   =   R e p l a c e ( o b j I t e m . U s e r N a m e ,   " \ " ,   " @ "   )  
         o u t p u t J S O N   =   o u t p u t J S O N   &     " ' S y s t e m U s e r N a m e '   :   ' "   &   U s e r N a m e   &   " ' ,   "  
     N e x t  
      
      
     '   G e t   p r o c e s s o r   i n f o r m a t i o n  
     S e t   c o l I t e m s   =   o b j W M I S e r v i c e . E x e c Q u e r y ( " S e l e c t   *   F r o m   W i n 3 2 _ P r o c e s s o r " )  
     F o r   E a c h   o b j I t e m   i n   c o l I t e m s  
         s t r P r o c e s s o r N a m e   =   o b j I t e m . N a m e  
     N e x t  
      
     '   G e t   R A M   i n f o r m a t i o n  
     S e t   c o l I t e m s   =   o b j W M I S e r v i c e . E x e c Q u e r y ( " S e l e c t   *   F r o m   W i n 3 2 _ C o m p u t e r S y s t e m " )  
     F o r   E a c h   o b j I t e m   i n   c o l I t e m s  
             i n t T o t a l M e m o r y   =   o b j I t e m . T o t a l P h y s i c a l M e m o r y  
     N e x t  
      
     '   C o n v e r t   m e m o r y   t o   G B  
     d b l T o t a l M e m o r y G B   =   i n t T o t a l M e m o r y   /   1 0 2 4   /   1 0 2 4   /   1 0 2 4  
      
     '   D i s p l a y   s y s t e m   i n f o r m a t i o n  
     o u t p u t J S O N   =   o u t p u t J S O N   &     " ' P r o c e s s o r N a m e '   :   ' "   &   s t r P r o c e s s o r N a m e   &   " ' ,   "  
     o u t p u t J S O N   =   o u t p u t J S O N   &     " ' R A M _ G B '   :   ' "   &   R o u n d ( d b l T o t a l M e m o r y G B ,   2 )   &   " ' ,   "  
      
     '   B i o s   s e r i a l   N u m b e r  
     S e t   c o l I t e m s   =   o b j W M I S e r v i c e . E x e c Q u e r y ( " S e l e c t   *   f r o m   W i n 3 2 _ B I O S " )  
     F o r   E a c h   o b j I t e m   i n   c o l I t e m s  
             o u t p u t J S O N   =   o u t p u t J S O N   &     " ' S e r i a l N u m b e r '   :   ' "   &   o b j I t e m . S e r i a l N u m b e r   &   " ' ,   "  
             o u t p u t J S O N   =   o u t p u t J S O N   &     " ' M a n u f a c t u r e r '   :   ' "   &   o b j I t e m . M a n u f a c t u r e r   &   " ' ,   "        
     N e x t  
      
     '   O p e r a t i n g   S y s t e m   I n f o r m a r i o n  
     S e t   c o l I t e m s   =   o b j W M I S e r v i c e . E x e c Q u e r y ( " S e l e c t   *   f r o m   W i n 3 2 _ O p e r a t i n g S y s t e m " )  
     F o r   E a c h   o b j I t e m   i n   c o l I t e m s  
             o u t p u t J S O N   =   o u t p u t J S O N   &     " ' O S _ N a m e '   :   ' "   &   o b j I t e m . C a p t i o n   &   " ' ,   "  
             o u t p u t J S O N   =   o u t p u t J S O N   &     " ' O S _ V e r s i o n '   :   ' "   &   o b j I t e m . V e r s i o n   &   " ' ,   "  
     N e x t  
      
      
      
     o u t p u t J S O N   =   o u t p u t J S O N   &     " } "  
      
     o u t p u t J S O N   =   R e p l a c e ( o u t p u t J S O N ,   " ' " ,   " " " " )  
     o u t p u t J S O N   =   R e p l a c e ( o u t p u t J S O N ,   " ,   } " ,   " } " )  
     ' W S c r i p t . E c h o   o u t p u t J S O N    
       P C i n f o   =     o u t p u t J S O N  
 E n d   F u n c t i o n  
  
  
  
 S e n d J s o n D a t a   =   P C i n f o ( o u t p u t J S O N )  
  
 F u n c t i o n   P o s t D a t a ( S e n d J s o n D a t a )  
  
     '   S e t   r e q u e s t   p r o p e r t i e s   :   h t t p s : / / r e q b i n . c o m / e c h o / p o s t / j s o n  
     s t r U R L   =   " h t t p : / / 1 0 . 3 4 . 1 3 0 . 2 5 4 : 3 0 0 5 / a p i - p c i n f o "  
     S e t   o b j H T T P   =   C r e a t e O b j e c t ( " M S X M L 2 . X M L H T T P " )  
     o b j H T T P . O p e n   " P O S T " ,   s t r U R L ,   F a l s e  
     o b j H T T P . s e t R e q u e s t H e a d e r   " C o n t e n t - T y p e " ,   " a p p l i c a t i o n / j s o n "  
      
     '   S e n d   r e q u e s t   a n d   g e t   r e s p o n s e  
     o b j H T T P . s e n d   S e n d J s o n D a t a  
     s t r R e s p o n s e T e x t   =   o b j H T T P . r e s p o n s e T e x t  
      
     '   D i s p l a y   r e s p o n s e  
     ' W S c r i p t . E c h o   s t r R e s p o n s e T e x t  
         P o s t D a t a   =   s t r R e s p o n s e T e x t  
 E n d   F u n c t i o n  
  
 r e s u l t   =     P o s t D a t a ( S e n d J s o n D a t a )  
  
 W S c r i p t . E c h o   l e f t ( r e s u l t , 2 5 )  
  
 D i m   o b j S h e l l  
 S e t   o b j S h e l l   =   W S c r i p t . C r e a t e O b j e c t ( " W S c r i p t . S h e l l " )  
 o b j S h e l l . R u n   " h t t p : / / 1 0 . 3 4 . 1 3 0 . 2 5 4 : 8 1 / "  
 S e t   o b j S h e l l   =   N o t h i n g  
  
 