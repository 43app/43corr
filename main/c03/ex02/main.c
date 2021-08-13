/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cybattis <cybattis@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/06 10:01:26 by cybattis          #+#    #+#             */
/*   Updated: 2021/08/11 10:54:09 by cybattis         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>

char	*ft_strcat(char *dest, char *src);

int	main(void)
{
	char	dest[20] = "la dest: ";
	char	dest_a[20] = "la dest: ";
	char	dest2[20] = "la dest: ";
	char	dest2_a[20] = "la dest: ";
	char	dest3[20] = "";
	char	dest3_a[20] = "";

	printf("%s\n", ft_strcat(dest, "Aou"));
	printf("%s\n", strcat(dest_a, "Aou"));
	printf("%s\n", ft_strcat(dest2, "coucou"));
	printf("%s\n", strcat(dest2_a, "coucou"));
	printf("%s\n", ft_strcat(dest3, ""));
	printf("%s\n", strcat(dest3_a, ""));
	return (0);
}
