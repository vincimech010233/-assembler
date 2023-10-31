SECTION .text
global distance_between_points

; arguments: xmm0, xmm1, xmm2, xmm3 <- a_x, a_y, b_x, b_y
; return value: xmm0 <- distance between the two points
distance_between_points:
  subsd xmm0, xmm2     ; xmm0 = a_x - b_x
  subsd xmm1, xmm3     ; xmm1 = a_y - b_y
  mulsd xmm0, xmm0     ; xmm0 = (a_x - b_x) * (a_x - b_x)
  mulsd xmm1, xmm1     ; xmm1 = (a_y - b_y) * (a_y - b_y)
  addsd xmm0, xmm1     ; xmm0 = (a_x - b_x)^2 + (a_y - b_y)^2
  sqrtsd xmm0, xmm0    ; xmm0 = sqrt((a_x - b_x)^2 + (a_y - b_y)^2)
  ret
