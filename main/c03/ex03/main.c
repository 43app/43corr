/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cybattis <cybattis@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/06 10:01:26 by cybattis          #+#    #+#             */
/*   Updated: 2021/08/11 11:01:12 by cybattis         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>

char	*ft_strncat(char *dest, char *src, unsigned int nb);

int	main(void)
{
	char	dest[20] = "la dest: ";
	char	dest_a[20] = "la dest: ";
	char	dest2[20] = "la dest: ";
	char	dest2_a[20] = "la dest: ";
	char	dest3[20] = "";
	char	dest3_a[20] = "";
	char	dest4[20] = "la dest: ";
	char	dest4_a[20] = "la dest: ";

	printf("%s\n", ft_strncat(dest, "wesh gros", 0));
	printf("%s\n", strncat(dest_a, "wesh gros", 0));
	printf("%s\n", ft_strncat(dest2, "coucou", 4));
	printf("%s\n", strncat(dest2_a, "coucou", 4));
	printf("%s\n", ft_strncat(dest3, "", 10));
	printf("%s\n", strncat(dest3_a, "", 10));
	printf("%s\n", ft_strncat(dest4, "wesh gros", 9));
	printf("%s\n", strncat(dest4_a, "wesh gros", 9));
	return (0);
}
