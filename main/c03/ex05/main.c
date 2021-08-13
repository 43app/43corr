/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cybattis <cybattis@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/06 10:01:26 by cybattis          #+#    #+#             */
/*   Updated: 2021/08/11 14:48:28 by cybattis         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>

unsigned int	ft_strlcat(char *dest, char *src, unsigned int size);

int	main(void)
{
	char	dest[20] = "dest:";
	char	dest_a[20] = "dest:";
	char	dest2[20] = "dest:";
	char	dest2_a[20] = "dest:";
	char	dest3[20] = "";
	char	dest3_a[20] = "";

	printf("%u\n", ft_strlcat(dest, "wesh gros", 18));
	printf("%s\n", dest);
	printf("%lu\n", strlcat(dest_a, "wesh gros", 18));
	printf("%s\n", dest_a);
	printf("%u\n", ft_strlcat(dest2, "couc", 8));
	printf("%s\n", dest2);
	printf("%lu\n", strlcat(dest2_a, "couc", 8));
	printf("%s\n", dest2_a);
	printf("%u\n", ft_strlcat(dest3, "", 10));
	printf("%s\n", dest3);
	printf("%lu\n", strlcat(dest3_a, "", 10));
	printf("%s\n", dest3_a);
	return (0);
}
